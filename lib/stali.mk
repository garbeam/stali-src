ROOT=..

SUBDIRS = zlib\
	libressl\
	ncurses\
	libtermkey\
	expat

include $(ROOT)/mk/dir.mk

libtermkey: ncurses
