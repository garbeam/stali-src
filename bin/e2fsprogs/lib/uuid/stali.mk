ROOT=../../../..

include $(ROOT)/config.mk

LIB = ../libuuid.a
LIB_INST =
OBJS=		clear.o \
		compare.o \
		copy.o \
		gen_uuid.o \
		isnull.o \
		pack.o \
		parse.o \
		unpack.o \
		unparse.o \
		uuid_time.o
CLEAN_FILES = uuid.h 
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

deps: uuid.h

uuid.h: uuid.h.in
	@cp uuid.h.in uuid.h
