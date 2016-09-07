ROOT=../..

include $(ROOT)/config.mk

VERSION = 0.15
CFLAGS += -I. -I$(ROOT)/lib/ncurses/include -std=c99 -Wall -DVERSION=\"${VERSION}\" -DNDEBUG 
CPPFLAGS += -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700
OBJS = dvtm.o vt.o
BIN = dvtm
LIBS = $(ROOT)/lib/ncurses/libncurses.a
DEPS = config.h
CLEAN_FILES = $(DEPS)

include $(ROOT)/mk/bin.mk

config.h:
	cp config.def.h config.h
