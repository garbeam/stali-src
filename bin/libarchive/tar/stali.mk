ROOT=../../..

include $(ROOT)/config.mk

BIN = tar
OBJS= bsdtar.o cmdline.o creation_set.o read.o subst.o util.o write.o
CLEAN_FILES =  
CPPFLAGS = -DHAVE_CONFIG_H
CFLAGS = -I. -I.. -I../libarchive -I../libarchive_fe
LDFLAGS += ../libarchive/libarchive.a $(ROOT)/lib/zlib/libz.a

include $(ROOT)/mk/bin.mk

