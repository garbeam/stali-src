ROOT=../..

LIBDIRS = lib/et\
	lib/ss\
	lib/ext2fs\
	lib/e2p\
	lib/uuid\
	lib/blkid\
	lib/support

SUBDIRS = util\
    $(LIBDIRS)\
	intl\
	e2fsck\
	debugfs\
	misc\
	resize

include $(ROOT)/mk/dir.mk

lib/et lib/ext2fs lib/ss misc: util

debugfs e2fsck intl misc resize: $(LIBDIRS)

# TODO: move dependencies into this file instead of
#       making everything depend on lib/et
lib/ss lib/ext2fs lib/e2p lib/uuid lib/blkid lib/support: lib/et
