ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I.
CPPFLAGS += 
OBJS = xstrtol.o\
	xstrtoll.o\
	stripslash.o\
	version-etc-fsf.o\
	localcharset.o\
	xstrtoull.o\
	xstrtoul.o\
	close-stream.o\
	wctype-h.o\
	malloca.o\
	xmalloc.o\
	xstrndup.o\
	xstrtol-error.o\
	closeout.o\
	quotearg.o\
	dirname-lgpl.o\
	long-options.o\
	version-etc.o\
	unistd.o\
	tempname.o\
	safe-read.o\
	c-strcasecmp.o\
	exitfail.o\
	dirname.o\
	glthread/threadlib.o\
	glthread/lock.o\
	argmatch.o\
	basename-lgpl.o\
	xstrtoll.o\
	c-ctype.o\
	fd-hook.o\
	basename.o\
	mbrtowc.o\
	c-strncasecmp.o\
	progname.o\
	error.o\
	canonicalize-lgpl.o\
	xalloc-die.o
DEPS = fcntl.h\
	inttypes.h\
	ref-add.sed\
	langinfo.h\
	alloca.h\
	configmake.h\
	stdio.h\
	arg-nonnull.h\
	wchar.h\
	charset.alias\
	locale.h\
	string.h\
	time.h\
	stdlib.h\
	wctype.h\
	ref-del.sed\
	sys/types.h\
	sys/time.h\
	sys/stat.h\
	warn-on-use.h\
	c++defs.h\
	unistd.h
LIB = libputil.a
CLEAN_FILES = $(DEPS)

include $(ROOT)/mk/lib.mk

$(DEPS):
	@echo GEN $@
	@cp $@.stali $@
