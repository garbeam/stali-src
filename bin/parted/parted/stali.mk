ROOT=../../..

include $(ROOT)/config.mk

BIN = parted
OBJS = parted.o\
	version.o\
	table.o\
	command.o\
	strlist.o\
	ui.o
CPPFLAGS += 
CFLAGS += -I. -I../lib -I../include
LDFLAGS += ../libparted/libparted.a ../../e2fsprogs/lib/libuuid.a ../lib/libputil.a 

include $(ROOT)/mk/bin.mk

