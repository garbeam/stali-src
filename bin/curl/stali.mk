ROOT=../..

SUBDIRS = lib\
	src

include $(ROOT)/mk/dir.mk

src: lib
