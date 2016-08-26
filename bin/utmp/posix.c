
#define _POSIX_C_SOURCE	200112L

#include <errno.h>
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include <sys/types.h>
#include <unistd.h>
#include <pwd.h>
#include <grp.h>

#ifdef UTMP_SYSTEMV
#include <utmp.h>
#define getutxent getutent
#define getutxid getutid
#define getutxline getutline
#define pututxline pututline
#define setutxent setutent
#define endutxent endutent
#define utmpx utmp
#else
#include <utmpx.h>
#endif

extern void die(const char *fmt, ...);
static struct utmpx utmp;
extern struct passwd *pw;
extern gid_t egid, gid;


/*
 * From utmp(5)
 * xterm and other terminal emulators directly create a USER_PROCESS
 * record and generate the ut_id  by using the string that suffix part of
 * the terminal name (the characters  following  /dev/[pt]ty). If they find
 * a DEAD_PROCESS for this ID, they recycle it, otherwise they create a new
 * entry.  If they can, they will mark it as DEAD_PROCESS on exiting and it
 * is advised that they null ut_line, ut_time, ut_user, and ut_host as well.
 */

struct utmpx *
findutmp(int type)
{
	struct utmpx *r;

	utmp.ut_type = type;
	setutxent();
	for(;;) {
	       /*
		* we can not use getutxline because we can search in
		* DEAD_PROCESS to
		*/
	       if(!(r = getutxid(&utmp)))
		       break;
	       if(!strcmp(r->ut_line, utmp.ut_line))
		       break;
	       memset(r, 0, sizeof(*r)); /* for Solaris, IRIX64 and HPUX */
	}
	return r;
}

void
addutmp(void)
{
	unsigned ptyid;
	char *pts, *cp, buf[5] = {'x'};

	if (strlen(pw->pw_name) > sizeof(utmp.ut_user))
		die("utmp:incorrect username %s", pw->pw_name);

	if ((pts = ttyname(STDIN_FILENO)) == NULL)
		die("utmp:error getting pty name\n");

	for (cp = pts + strlen(pts) - 1; isdigit(*cp); --cp)
		/* nothing */;

	ptyid = atoi(++cp);
	if (ptyid > 999 || strlen(pts + 5) > sizeof(utmp.ut_line))
		die("utmp:Incorrect pts name %s\n", pts);
	sprintf(buf + 1, "%03d", ptyid);
	strncpy(utmp.ut_id, buf, 4);

	/* remove /dev/ part of the string */
	strncpy(utmp.ut_line, pts + 5, sizeof(utmp.ut_line));

	if(!findutmp(DEAD_PROCESS))
		findutmp(USER_PROCESS);

	utmp.ut_type = USER_PROCESS;
	strncpy(utmp.ut_user, pw->pw_name, sizeof(utmp.ut_user));
	utmp.ut_pid = getpid();
	utmp.ut_tv.tv_sec = time(NULL);
	utmp.ut_tv.tv_usec = 0;
	 /* don't use no standard fields host and session */

	setegid(egid);
	if(!pututxline(&utmp))
		die("utmp:error adding utmp entry:%s", strerror(errno));
	setegid(gid);
	endutxent();
}

void
delutmp(void)
{
	struct utmpx *r;

	setutxent();
	if((r = getutxline(&utmp)) != NULL) {
		r->ut_type = DEAD_PROCESS;
		r->ut_tv.tv_usec = r->ut_tv.tv_sec = 0;
		setgid(egid);
		if (!pututxline(r))
			die("utmp:error removing utmp entry:%s", strerror(errno));
		setgid(gid);
	}
	endutxent();
}

