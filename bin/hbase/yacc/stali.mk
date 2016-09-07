ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DPARSER=\"/tmp/yaccpar\"
LDFLAGS += -L. -ly
BIN = yacc
OBJS = y1.o y2.o y3.o y4.o y5.o getopt.o
LOBJS = libmai.o libzer.o
DEPS = liby.a /tmp/yaccpar
CLEAN_FILES = $(LOBJS) $(DEPS)
CC = $(HOSTCC)
AR = $(HOSTAR)
RANLIB = $(HOSTRANLIB)
CFLAGS = $(HOSTCFLAGS)

include $(ROOT)/mk/bin.mk

liby.a: $(LOBJS)
	@echo AR $@
	@$(AR) cr $@ $(LOBJS)
	@$(RANLIB) $@

/tmp/yaccpar: yaccpar
	@echo copying yaccpar to /tmp
	@cp -f $^ $@

y1.o: dextern
y2.o: dextern sgs.h
y3.o: dextern
y4.o: dextern
