ROOT=../..

SUBDIRS = libarchive\
	  cpio\
	  tar

include $(ROOT)/mk/dir.mk

cpio tar: libarchive
