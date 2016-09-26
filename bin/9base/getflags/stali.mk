# getflags - unix port from plan9
#
# Depends on ../lib9
ROOT=../../..
include $(ROOT)/config.mk

CFLAGS += -I../lib9
BIN = getflags
OBJS = getflags.o
LIBS = ../lib9/lib9.a

include $(ROOT)/mk/bin.mk
