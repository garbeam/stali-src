# rc - rc shell unix port from plan9
# Depends on ../lib9
ROOT=../../..
include $(ROOT)/config.mk

CFLAGS += -I../lib9
BIN = rc
LIBS = ../lib9/lib9.a
OBJS = code.o exec.o getflags.o glob.o here.o io.o lex.o \
       pcmd.o pfnc.o simple.o subr.o trap.o tree.o unixcrap.o \
       var.o y.tab.o plan9ish.o havefork.o
DEPS = x.tab.h
CLEANFILES = y.tab.c x.tab.h _ytab

include $(ROOT)/mk/bin.mk

y.tab.c x.tab.h: _ytab ;

_ytab: syn.y
	@echo YACC -d $?
	@$(YACC) -d $?
	@mv y.tab.h x.tab.h
	@touch $@

postinst:
	@mkdir -p $(DESTDIR)$(PREFIX)/etc
	@cp -f rcmain $(DESTDIR)$(PREFIX)/etc
	@chmod 755 $(DESTDIR)$(PREFIX)/etc/rcmain

postuninst:
	@rm -f $(DESTDIR)$(PREFIX)/etc/rcmain

