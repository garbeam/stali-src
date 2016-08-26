ROOT=../../..

include $(ROOT)/config.mk

LIB = libcommon.a
OBJS = asciitype.o ib_alloc.o ib_close.o ib_free.o ib_getlin.o ib_getw.o \
	ib_open.o ib_popen.o ib_read.o ib_seek.o oblok.o sfile.o strtol.o \
	getdir.o regexpr.o gmatch.o utmpx.o memalign.o pathconf.o \
	sigset.o signal.o sigrelse.o sighold.o sigignore.o sigpause.o \
	getopt.o pfmt.o vpfmt.o setlabel.o setuxlabel.o pfmt_label.o sysv3.o
CLEAN_FILES = alloca.h malloc.h utmpx.h

include $(ROOT)/mk/lib.mk

deps: headers

CHECK: CHECK.c
	@echo CC CHECK
	$(CC) $(CFLAGS) $(CPPFLAGS) -E CHECK.c >CHECK

headers: CHECK
	@for i in alloca malloc utmpx; do rm -f $$i.h; if grep "$1_h[	 ]*=[ 	]*[^0][	 ]*;" CHECK >/dev/null; then ln -s "_$$i.h" "$$i.h"; fi; done
