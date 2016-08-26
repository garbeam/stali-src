/* See LICENSE file for copyright and license details. */
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "../util.h"

/* read uevent file and set environment variables */
int
readuevent(const char *file)
{
	FILE *fp;
	int status = 0;
	char buf[BUFSIZ];
	char *p, *name, *value;

	if(!(fp = fopen(file, "r")))
		return -1;
	while(!feof(fp)) {
		fgets(buf, sizeof(buf) - 1, fp);
		if(ferror(fp)) {
			status = -2;
			break;
		}
		if((p = strchr(buf, '\n')))
			*p = '\0';
		if(!(p = strchr(buf, '=')))
			continue;
		*p = '\0';
		p++;
		name = buf;
		value = p;
		setenv(name, value, 1);
	}
	fclose(fp);
	return status;
}

/* `majmin' format is maj:min */
int
devtype(const char *majmin)
{
	char path[PATH_MAX];

	snprintf(path, sizeof(path), "/sys/dev/block/%s", majmin);
	if (!access(path, F_OK))
		return S_IFBLK;
	snprintf(path, sizeof(path), "/sys/dev/char/%s", majmin);
	if (!access(path, F_OK))
		return S_IFCHR;
	return -1;
}
