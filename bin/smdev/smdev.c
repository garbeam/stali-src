/* See LICENSE file for copyright and license details. */
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <linux/sockios.h>
#include <linux/if_packet.h>
#include <net/if.h>
#include <netinet/in.h>
#include <ifaddrs.h>

#include <errno.h>
#include <fcntl.h>
#include <grp.h>
#include <libgen.h>
#include <limits.h>
#include <pwd.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "config.h"
#include "mkpath.h"
#include "util.h"

enum action {
	ADD_ACTION,
	REMOVE_ACTION,
	UNKNOWN_ACTION
};

struct event {
	int minor;
	int major;
	enum action action;
	char *devpath;
	char *devname;
	struct rule *rule;
};

/* Simple cache for regcomp() results */
static struct pregentry {
	regex_t preg;
	int cached;
} pregcache[LEN(rules)];

/* The expanded/parsed path components of a rule */
struct rulepath {
	char path[PATH_MAX];
	char name[PATH_MAX];
};

static int dohotplug(void);
static int matchrule(int, char *);
static void runrulecmd(struct rule *);
static void parsepath(struct rule *, struct rulepath *, const char *);
static int removedev(struct event *);
static int createdev(struct event *);
static int doevent(struct event *);
static int craftev(char *);
static void populatedev(const char *);
static int ifrename(void);

static void
usage(void)
{
	eprintf("usage: %s [-s]\n", argv0);
}

int
main(int argc, char *argv[])
{
	int sflag = 0;
	int i;

	ARGBEGIN {
	case 's':
		sflag = 1;
		break;
	default:
		usage();
	} ARGEND;

	umask(0);
	if (sflag) {
		recurse("/sys/devices", populatedev);
	} else {
		if (dohotplug() < 0)
			eprintf("Environment not set up correctly for hotplugging\n");
	}

	for (i = 0; i < LEN(pregcache); i++)
		if (pregcache[i].cached)
			regfree(&pregcache[i].preg);

	if (ifrename() < 0)
		return EXIT_FAILURE;

	return EXIT_SUCCESS;
}

static enum action
mapaction(const char *action)
{
	if (strcmp(action, "add") == 0)
		return ADD_ACTION;
	if (strcmp(action, "remove") == 0)
		return REMOVE_ACTION;
	return UNKNOWN_ACTION;
}

/* Handle hotplugging events */
static int
dohotplug(void)
{
	char *minor, *major;
	char *action;
	char *devpath;
	char *devname;
	struct event ev;

	minor = getenv("MINOR");
	major = getenv("MAJOR");
	action = getenv("ACTION");
	devpath = getenv("DEVPATH");
	devname = getenv("DEVNAME");
	if (!minor || !major || !action || !devpath || !devname)
		return -1;

	ev.minor = estrtol(minor, 10);
	ev.major = estrtol(major, 10);
	ev.action = mapaction(action);
	ev.devpath = devpath;
	ev.devname = devname;
	return doevent(&ev);
}

/*
 * `ruleidx' indexes into the rules[] table.  We assume
 * pregcache[] is mapped 1-1 with the rules[] table.
 */
static int
matchrule(int ruleidx, char *devname)
{
	struct rule *rule = &rules[ruleidx];
	regex_t *preg;
	regmatch_t pmatch;
	int ret;

	if (!pregcache[ruleidx].cached) {
		ret = regcomp(&pregcache[ruleidx].preg,
			      rule->devregex, REG_EXTENDED);
		if (ret < 0)
			eprintf("regcomp:");
		pregcache[ruleidx].cached = 1;
	}
	preg = &pregcache[ruleidx].preg;

	ret = regexec(preg, devname, 1, &pmatch, 0);
	if (ret == REG_NOMATCH || pmatch.rm_so ||
	    pmatch.rm_eo != strlen(devname))
		return -1;
	return 0;
}

static void
runrulecmd(struct rule *rule)
{
	if (rule->cmd)
		system(&rule->cmd[1]);
}

static void
parsepath(struct rule *rule, struct rulepath *rpath,
	  const char *devname)
{
	char buf[PATH_MAX], *path, *dirc;
	const char *basedevname;

	if(!(basedevname = strrchr(devname, '/')))
		basedevname = devname;

	if (!rule->path) {
		strlcpy(rpath->name, basedevname, sizeof(rpath->name));
		snprintf(rpath->path, sizeof(rpath->path), "/dev/%s",
			 rpath->name);
		return;
	}

	if (rule->path[0] != '=' && rule->path[0] != '>')
		eprintf("Invalid path '%s'\n", rule->path);

	path = strdup(&rule->path[1]);
	if (!path)
		eprintf("strdup:");

	/* No need to rename the device node */
	if (rule->path[strlen(rule->path) - 1] == '/') {
		snprintf(rpath->path, sizeof(rpath->path), "/dev/%s%s",
			 path, basedevname);
		strlcpy(rpath->name, basedevname, sizeof(rpath->name));
		free(path);
		return;
	}

	if (strchr(path, '/')) {
		if (!(dirc = strdup(path)))
			eprintf("strdup:");
		snprintf(buf, sizeof(buf), "/dev/%s", dirname(dirc));
		strlcpy(rpath->name, basename(path), sizeof(rpath->name));
		snprintf(rpath->path, sizeof(rpath->path), "%s/%s", buf,
			 rpath->name);
		free(dirc);
	} else {
		strlcpy(rpath->name, path, sizeof(rpath->name));
		snprintf(rpath->path, sizeof(rpath->path), "/dev/%s",
			 rpath->name);
	}

	free(path);
}

static int
removedev(struct event *ev)
{
	struct rule *rule;
	struct rulepath rpath;
	char *ocwd;
	char buf[PATH_MAX];

	rule = ev->rule;
	ocwd = agetcwd();

	parsepath(rule, &rpath, ev->devname);

	if(rule->cmd) {
		if (chdir("/dev") < 0)
			eprintf("chdir /dev:");
		runrulecmd(rule);
	}

	if (chdir(ocwd) < 0)
		eprintf("chdir %s:", ocwd);

	free(ocwd);

	if (rule->path && rule->path[0] == '!')
		return 0;

	/* Delete device node */
	unlink(rpath.path);
	/* Delete symlink */
	if (rule->path && rule->path[0] == '>') {
		snprintf(buf, sizeof(buf), "/dev/%s", ev->devname);
		unlink(buf);
	}
	return 0;
}

static int
createdev(struct event *ev)
{
	struct rule *rule;
	struct rulepath rpath;
	struct passwd *pw;
	struct group *gr;
	char *dirc, *ocwd;
	char buf[BUFSIZ];
	int type;

	rule = ev->rule;
	ocwd = agetcwd();

	if (rule->path && rule->path[0] == '!')
		goto runrule;

	snprintf(buf, sizeof(buf), "%d:%d", ev->major, ev->minor);
	if ((type = devtype(buf)) < 0)
		return -1;

	/* Parse path and create the directory tree */
	parsepath(rule, &rpath, ev->devname);
	if (!(dirc = strdup(rpath.path)))
		eprintf("strdup:");
	strlcpy(buf, dirname(dirc), sizeof(buf));
	free(dirc);
	umask(022);
	if (mkpath(buf, 0755) < 0)
		eprintf("mkdir %s:", buf);
	umask(0);

	if (mknod(rpath.path, rule->mode | type,
		  makedev(ev->major, ev->minor)) < 0 &&
	    errno != EEXIST)
		eprintf("mknod %s:", rpath.path);

	errno = 0;
	pw = getpwnam(rule->user);
	if (!pw) {
		if (errno)
			eprintf("getpwnam %s:", rule->user);
		else
			eprintf("getpwnam %s: no such user\n",
				 rule->user);
	}

	errno = 0;
	gr = getgrnam(rule->group);
	if (!gr) {
		if (errno)
			eprintf("getgrnam %s:", rule->group);
		else
			eprintf("getgrnam %s: no such group\n",
				 rule->group);
	}

	if (chown(rpath.path, pw->pw_uid, gr->gr_gid) < 0)
		eprintf("chown %s:", rpath.path);

	if (chmod(rpath.path, rule->mode) < 0)
		eprintf("chmod %s:", rpath.path);

	if (rule->path && rule->path[0] == '>') {
		/* ev->devname is the original device name */
		snprintf(buf, sizeof(buf), "/dev/%s", ev->devname);
		symlink(rpath.path, buf);
	}

runrule:
	if(rule->cmd) {
		if (chdir("/dev") < 0)
			eprintf("chdir /dev:");
		runrulecmd(rule);
	}

	if (chdir(ocwd) < 0)
		eprintf("chdir %s:", ocwd);

	free(ocwd);

	return 0;
}

/* Event dispatcher */
static int
doevent(struct event *ev)
{
	int i;

	for (i = 0; i < LEN(rules); i++) {
		if (matchrule(i, ev->devname) < 0)
			continue;
		ev->rule = &rules[i];
		switch (ev->action) {
		case ADD_ACTION:
			return createdev(ev);
		case REMOVE_ACTION:
			return removedev(ev);
		default:
			return 0;
		}
	}
	return 0;
}

/* Craft a fake event so the rest of the code can cope */
static int
craftev(char *sysfspath)
{
	char path[PATH_MAX];
	char *devpath;

	devpath = sysfspath + strlen("/sys");
	snprintf(path, sizeof(path), "/sys%s/uevent", devpath);

	clearenv();
	setenv("ACTION", "add", 1);
	setenv("DEVPATH", devpath, 1);
	if(readuevent(path) < 0)
		return -1;
	return 0;
}

static void
populatedev(const char *path)
{
	char *cwd;

	recurse(path, populatedev);
	if (strcmp(path, "dev") == 0) {
		cwd = agetcwd();
		if (!craftev(cwd))
			dohotplug();
		free(cwd);
	}
}

static int
ifrename(void)
{
	struct sockaddr_ll *sa;
	struct ifaddrs *ifas, *ifa;
	struct ifreq ifr;
	int sd;
	int i;
	int r;
	int ok = 0;

	sd = socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);
	if (sd < 0)
		eprintf("socket:");
	r = getifaddrs(&ifas);
	if (r < 0)
		eprintf("getifaddrs:");
	for (ifa = ifas; ifa; ifa = ifa->ifa_next) {
		if (ifa->ifa_flags & IFF_LOOPBACK)
			continue;
		if (ifa->ifa_addr->sa_family != AF_PACKET)
			continue;
		sa = (struct sockaddr_ll *)ifa->ifa_addr;
		for (i = 0; mac2names[i].name; i++) {
			if (memcmp(mac2names[i].mac, sa->sll_addr, 6) != 0)
				continue;
			memset(&ifr, 0, sizeof(ifr));
			strlcpy(ifr.ifr_name,
				ifa->ifa_name, sizeof(ifr.ifr_name));
			strlcpy(ifr.ifr_newname,
				mac2names[i].name, sizeof(ifr.ifr_newname));
			r = ioctl(sd, SIOCSIFNAME, &ifr);
			if (r < 0) {
				weprintf("SIOCSIFNAME:");
				ok = -1;
			}
		}
	}
	freeifaddrs(ifas);
	close(sd);
	return ok;
}
