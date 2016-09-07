ROOT=../../..

include $(ROOT)/config.mk

BIN = cpio
OBJS= cmdline.o cpio.o
CLEAN_FILES =  
CPPFLAGS = -DHAVE_CONFIG_H
CFLAGS = -I. -I.. -I../libarchive -I../libarchive_fe
LIBS = ../libarchive/libarchive.a $(ROOT)/lib/zlib/libz.a

include $(ROOT)/mk/bin.mk
