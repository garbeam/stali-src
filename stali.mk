ROOT=.

export STALISRC:=$(shell pwd)

include $(ROOT)/config.mk

SUBDIRS = etc\
	lib\
	bin\
	$(SYS)

world: all

include $(ROOT)/mk/dir.mk
