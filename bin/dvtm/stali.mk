ROOT=../..

include $(ROOT)/config.mk

VERSION = 0.15
CFLAGS += -I. -I$(ROOT)/lib/ncurses/include -std=c99 -Wall -DVERSION=\"${VERSION}\" -DNDEBUG 
CPPFLAGS += -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700
OBJS = dvtm.o vt.o
BIN = dvtm
LDFLAGS += $(ROOT)/lib/ncurses/libncurses.a
CLEAN_FILES = config.h

include $(ROOT)/mk/bin.mk

deps: config.h

config.h:
	cp config.def.h config.h
