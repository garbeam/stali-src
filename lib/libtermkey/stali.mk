ROOT=../..

include $(ROOT)/config.mk

CFLAGS = -std=c99 -I./ -I../ncurses/include
CPPFLAGS = 
LIB = libtermkey.a
OBJS = termkey.o\
	driver-csi.o\
	driver-ti.o
CLEAN_FILES = 

include $(ROOT)/mk/lib.mk
