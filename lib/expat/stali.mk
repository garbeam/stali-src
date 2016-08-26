ROOT=../..

include $(ROOT)/config.mk

CFLAGS += -I. -Ilib
CPPFLAGS += -DHAVE_MEMMOVE
LIB = libexpat.a
OBJS = lib/xmltok.o\
	lib/xmlparse.o\
	lib/xmlrole.o
CLEAN_FILES = 

include $(ROOT)/mk/lib.mk
