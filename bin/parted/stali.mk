ROOT=../..

SUBDIRS = lib\
	libparted\
	parted

include $(ROOT)/mk/dir.mk

parted: lib libparted
