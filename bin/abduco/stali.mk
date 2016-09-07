ROOT=../..

include $(ROOT)/config.mk

VERSION = 0.6
CFLAGS += -std=c99 -pedantic -Wall -DVERSION=\"${VERSION}\" -DNDEBUG 
CPPFLAGS += -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700
OBJS = abduco.o
BIN = abduco
DEPS = config.h
CLEAN_FILES = $(DEPS)

include $(ROOT)/mk/bin.mk

config.h:
	cp config.def.h config.h
