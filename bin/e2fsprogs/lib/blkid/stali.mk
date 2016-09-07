ROOT=../../../..

include $(ROOT)/config.mk

LIB = ../libblkid.a
LIB_INST =
OBJS= cache.o dev.o devname.o devno.o getsize.o llseek.o probe.o \
 read.o resolve.o save.o tag.o version.o 
DEPS = blkid.h blkid_types.h
CLEAN_FILES = $(DEPS)
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

blkid.h: blkid.h.in
	@cp blkid.h.in blkid.h

blkid_types.h: blkid_types.h.in 
	@cp blkid_types.h.in blkid_types.h
