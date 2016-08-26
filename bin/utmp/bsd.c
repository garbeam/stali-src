
#include <ctype.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

#include <unistd.h>
#include <util.h>
#include <grp.h>
#include <utmp.h>
#include <pwd.h>

extern void die(const char *fmt, ...);
extern struct passwd *pw;
extern gid_t egid, gid;
static struct utmp utmp;

void
addutmp(void)
{
	unsigned ptyid;
	char *pts, *cp, *host;


	if (!(host = getenv("DISPLAY")))
		host = "-";

	if (strlen(pw->pw_name) > sizeof(utmp.ut_name))
		die("utmp:incorrect username %s", pw->pw_name);

	if ((pts = ttyname(STDIN_FILENO)) == NULL)
		die("utmp:error getting pty name:%s", strerror(errno));

	for (cp = pts + strlen(pts) - 1; isdigit(*cp); --cp)
		/* nothing */;

	ptyid = atoi(++cp);
	if (ptyid > 999 || strlen(pts + 5) > sizeof(utmp.ut_line))
		die("utmp:Incorrect pts name %s\n", pts);

	/* remove /dev/ from pts */
	strncpy(utmp.ut_line, pts + 5, sizeof(utmp.ut_line));
	strncpy(utmp.ut_name, pw->pw_name, sizeof(utmp.ut_name));
	strncpy(utmp.ut_host, host, sizeof(utmp.ut_host));
	time(&utmp.ut_time);

	setegid(egid);
	login(&utmp);
	setegid(gid);
}

void
delutmp(void)
{
	setgid(egid);
	logout(utmp.ut_line);
	setgid(gid);
}

