ROOT=../../..

include $(ROOT)/config.mk

BIN = resize2fs
OBJS= extent.o resize2fs.o main.o online.o resource_track.o sim_progress.o
CLEAN_FILES =  
CPPFLAGS = -DHAVE_CONFIG_H
CFLAGS = -I. -I../lib -I../intl
LIBS = ../lib/libe2p.a ../lib/libext2fs.a ../lib/libcom_err.a ../intl/libintl.a

include $(ROOT)/mk/bin.mk
