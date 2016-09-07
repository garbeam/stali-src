ROOT=../../..

include $(ROOT)/config.mk

LIB = libcommon.a
OBJS = asciitype.o ib_alloc.o ib_close.o ib_free.o ib_getlin.o ib_getw.o \
	ib_open.o ib_popen.o ib_read.o ib_seek.o oblok.o sfile.o strtol.o \
	getdir.o regexpr.o gmatch.o utmpx.o memalign.o pathconf.o \
	sigset.o signal.o sigrelse.o sighold.o sigignore.o sigpause.o \
	getopt.o pfmt.o vpfmt.o setlabel.o setuxlabel.o pfmt_label.o sysv3.o
HEADERS = alloca.h malloc.h utmpx.h
DEPS = CHECK headers
CLEAN_FILES = $(DEPS) $(HEADERS)

include $(ROOT)/mk/lib.mk

CHECK: CHECK.c
	@echo CC CHECK
	@$(CC) $(CFLAGS) $(CPPFLAGS) -E CHECK.c >CHECK

headers: CHECK
	@for f in $(HEADERS); do if grep -q "$${f%.h}_h[[:space:]]*=[[:space:]]*[^0][[:space:]]*;" CHECK; then ln -s "_$$f" "$$f"; fi; done
	@touch $@
