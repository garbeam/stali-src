ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I.
CPPFLAGS +=
LIB = libgzip.a
OBJS = stripslash.o\
	localcharset.o\
	fd-safer.o\
	pipe-safer.o\
	openat-die.o\
	close-stream.o\
	wctype-h.o\
	chdir-long.o\
	xmalloc.o\
	fclose.o\
	closeout.o\
	stat-time.o\
	quotearg.o\
	dirname-lgpl.o\
	freadahead.o\
	filenamecat-lgpl.o\
	fpurge.o\
	savedir.o\
	opendir-safer.o\
	printf-parse.o\
	unistd.o\
	creat-safer.o\
	dup-safer.o\
	c-strcasecmp.o\
	printf-args.o\
	exitfail.o\
	xsize.o\
	freading.o\
	glthread/threadlib.o\
	glthread/lock.o\
	cloexec.o\
	math.o\
	yesno.o\
	utimens.o\
	vasnprintf.o\
	basename-lgpl.o\
	gettime.o\
	open-safer.o\
	asnprintf.o\
	fseeko.o\
	c-ctype.o\
	timespec.o\
	save-cwd.o\
	fd-hook.o\
	openat-proc.o\
	printf-frexpl.o\
	openat-safer.o\
	mbrtowc.o\
	c-strncasecmp.o\
	printf-frexp.o\
	strerror_r.o\
	statat.o\
	fcntl.o\
	closein.o\
	error.o\
	fflush.o\
	fseek.o\
	xalloc-die.o
DEPS = alloca.h\
	configmake.h\
	c++defs.h\
	arg-nonnull.h\
	warn-on-use.h\
	dirent.h\
	fcntl.h\
	math.h\
	unused-parameter.h\
	stdio.h\
	stdlib.h\
	string.h\
	sys/stat.h\
	sys/time.h\
	sys/types.h\
	time.h\
	unistd.h\
	wchar.h\
	wctype.h

CLEAN_FILES = $(DEPS)

include $(ROOT)/mk/lib.mk

$(DEPS):
	@echo GEN $@
	@cp $@.stali $@
