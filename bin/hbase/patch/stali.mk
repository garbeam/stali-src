ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -D_BSD_SOURCE
LDFLAGS += -pthread
BIN = patch
OBJS = patch.o backupfile.o inp.o mkpath.o pch.o util.o

include $(ROOT)/mk/bin.mk
