ROOT=../../../..

include $(ROOT)/config.mk

DATADIR = $(PREFIX)/share
LOCALEDIR = $(DATADIR)/locale
CFLAGS += -I. -I.. -g -O2 -Wall -Wextra -Wmissing-noreturn -Wdisabled-optimization -Wcast-align -Wshadow -Wmissing-format-attribute -Wmissing-prototypes -Wstrict-prototypes -Wmissing-declarations
CPPFLAGS += -DDATADIR=\"$(DATADIR)\" -DLOCALEDIR=\"$(LOCALEDIR)\" -D_BSD_SOURCE -U_GNU_SOURCE -D_FORTIFY_SOURCE=2 -funit-at-a-time
LIB = libkeymap.a
OBJS = analyze.o\
	array.o\
	common.o\
	diacr.o\
	dump.o\
	findfile.o\
	func.o\
	kernel.o\
	kmap.o\
	ksyms.o\
	loadkeys.o\
	modifiers.o\
	parser.o\
	summary.o
CLEAN_FILES = parser.c analyze.c parser.h analyze.h

include $(ROOT)/mk/lib.mk

deps: parser.h analyze.h

parser.h parser.c:
	@$(SHELL) ../../config/ylwrap parser.y y.tab.c parser.c y.tab.h parser.h y.output parser.output -- bison -y

analyze.h analyze.c:
	@$(SHELL) ../../config/ylwrap analyze.l lex.yy.c analyze.c -- flex --header-file=$(PWD)/analyze.h
