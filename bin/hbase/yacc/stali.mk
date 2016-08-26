ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DPARSER=\"/tmp/yaccpar\"
LDFLAGS += -L. -ly
BIN = yacc
OBJS = y1.o y2.o y3.o y4.o y5.o getopt.o
LOBJS = libmai.o libzer.o
CLEAN_FILES = $(LOBJS) liby.a
CC = $(HOSTCC)
AR = $(HOSTAR)
RANLIB = $(HOSTRANLIB)
CFLAGS = $(HOSTCFLAGS)

include $(ROOT)/mk/bin.mk

deps: liby.a tmpyaccpar

liby.a: $(LOBJS)
	@echo AR $@
	@$(AR) cr $@ $(LOBJS)
	@$(RANLIB) $@

tmpyaccpar:
	@echo copying yaccpar to /tmp
	@cp -f yaccpar /tmp

install:

postinst:

postuninst:

uninstall:

y1.o: dextern
y2.o: dextern sgs.h
y3.o: dextern
y4.o: dextern
