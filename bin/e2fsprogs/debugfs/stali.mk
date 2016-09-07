ROOT=../../..

include $(ROOT)/config.mk

BIN = debugfs
OBJS= debug_cmds.o debugfs.o util.o ncheck.o icheck.o ls.o \
	lsdel.o dump.o set_fields.o logdump.o htree.o unused.o e2freefrag.o \
	filefrag.o extent_cmds.o extent_inode.o zap.o create_inode.o \
	quota.o xattrs.o journal.o revoke.o recovery.o do_journal.o
CLEAN_FILES =  extent_cmds.c extent_cmds.h debug_cmds.c debug_cmds.h _extent_cmds _debug_cmds
CPPFLAGS = -DHAVE_CONFIG_H -DDEBUGFS
CFLAGS = -I. -I../lib -I../intl -I../e2fsck
LDFLAGS += -ldl
LIBS = ../lib/libsupport.a ../lib/libext2fs.a ../lib/libe2p.a ../lib/libss.a ../lib/libcom_err.a ../lib/libblkid.a ../lib/libuuid.a ../lib/libuuid.a

include $(ROOT)/mk/bin.mk

e2freefrag.o: ../misc/e2freefrag.c
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

create_inode.o: ../misc/create_inode.c
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

revoke.o: ../e2fsck/revoke.c
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

recovery.o: ../e2fsck/recovery.c
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

extent_cmds.c extent_cmds.h: _extent_cmds ;

_extent_cmds: extent_cmds.ct
	@DIR=../lib/ss ../lib/ss/mk_cmds extent_cmds.ct
	@touch $@

debug_cmds.c debug_cmds.h: _debug_cmds ;

_debug_cmds: debug_cmds.ct
	@DIR=../lib/ss ../lib/ss/mk_cmds debug_cmds.ct
	@touch $@
