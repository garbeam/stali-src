ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = fmt
OBJS = fmt.o

include $(ROOT)/mk/bin.mk
