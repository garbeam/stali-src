ROOT=../..

SUBDIRS = util\
	lib/et\
	lib/ss\
	lib/ext2fs\
	lib/e2p\
	lib/uuid\
	lib/blkid\
	lib/support\
	intl\
	e2fsck\
	debugfs\
	misc\
	resize

include $(ROOT)/mk/dir.mk
