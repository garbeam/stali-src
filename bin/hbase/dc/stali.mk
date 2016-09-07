ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DSHELL=\"/bin/sh\"
CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = dc
OBJS = dc.o

include $(ROOT)/mk/bin.mk
