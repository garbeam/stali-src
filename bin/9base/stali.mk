ROOT=../..

VERSION = 7

SUBDIRS =\
	lib9\
	troff\
	rc\
	getflags

include $(ROOT)/mk/dir.mk

troff rc getflags: lib9
