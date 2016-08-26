/* See LICENSE file for copyright and license details. */
#include "arg.h"

#define LEN(x) (sizeof (x) / sizeof *(x))

extern char *argv0;

char *agetcwd(void);
void apathmax(char **, long *);
int readuevent(const char *);
int devtype(const char *);
void enprintf(int, const char *, ...);
void eprintf(const char *, ...);
void weprintf(const char *, ...);
long estrtol(const char *, int);
void recurse(const char *, void (*)(const char *));
#undef strlcpy
size_t strlcpy(char *, const char *, size_t);
