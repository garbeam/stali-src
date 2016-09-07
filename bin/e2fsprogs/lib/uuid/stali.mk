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
DEPS = uuid.h
CLEAN_FILES = $(DEPS)
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

uuid.h: uuid.h.in
	@cp uuid.h.in uuid.h
