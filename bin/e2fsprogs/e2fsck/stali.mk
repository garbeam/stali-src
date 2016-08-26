ROOT=../../..

include $(ROOT)/config.mk

BIN = e2fsck
OBJS= unix.o e2fsck.o super.o pass1.o pass1b.o pass2.o \
	pass3.o pass4.o pass5.o journal.o badblocks.o util.o dirinfo.o \
	dx_dirinfo.o ehandler.o problem.o message.o quota.o recovery.o \
	region.o revoke.o ea_refcount.o rehash.o \
	logfile.o sigcatcher.o $(MTRACE_OBJ) readahead.o \
	extents.o
CLEAN_FILES = 
CPPFLAGS = -DHAVE_CONFIG_H
CFLAGS = -I../lib -I../intl
LDFLAGS += ../lib/libsupport.a ../lib/libext2fs.a ../lib/libcom_err.a ../lib/libblkid.a ../lib/libuuid.a ../lib/libuuid.a ../intl/libintl.a ../lib/libe2p.a 

include $(ROOT)/mk/bin.mk

