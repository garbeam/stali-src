ROOT=.

export STALISRC:=$(shell pwd)

include $(ROOT)/config.mk

SUBDIRS = etc\
	lib\
	bin\
	$(SYS)

include $(ROOT)/mk/dir.mk

bin: lib
