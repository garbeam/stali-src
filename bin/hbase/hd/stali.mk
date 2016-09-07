ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = hd
OBJS = hd.o

include $(ROOT)/mk/bin.mk
