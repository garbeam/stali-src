ROOT=../../../..

include $(ROOT)/config.mk

LIB = ../libext2fs.a
LIB_INST =
DEBUGFS_LIB_OBJS = bb_compat.o inode_io.o write_bb_file.o
RESIZE_LIB_OBJS = dupfs.o
E2IMAGE_LIB_OBJS = imager.o
TEST_IO_LIB_OBJS = test_io.o
OBJS= $(DEBUGFS_LIB_OBJS) $(RESIZE_LIB_OBJS) $(E2IMAGE_LIB_OBJS) \
	$(TEST_IO_LIB_OBJS) \
	ext2_err.o \
	alloc.o \
	alloc_sb.o \
	alloc_stats.o \
	alloc_tables.o \
	atexit.o \
	badblocks.o \
	bb_inode.o \
	bitmaps.o \
	bitops.o \
	blkmap64_ba.o \
	blkmap64_rb.o \
	blknum.o \
	block.o \
	bmap.o \
	check_desc.o \
	closefs.o \
	crc16.o \
	crc32c.o \
	csum.o \
	dblist.o \
	dblist_dir.o \
	dirblock.o \
	dirhash.o \
	dir_iterate.o \
	expanddir.o \
	ext_attr.o \
	extent.o \
	fallocate.o \
	fileio.o \
	finddev.o \
	flushb.o \
	freefs.o \
	gen_bitmap.o \
	gen_bitmap64.o \
	get_num_dirs.o \
	get_pathname.o \
	getsize.o \
	getsectsize.o \
	i_block.o \
	icount.o \
	ind_block.o \
	initialize.o \
	inline.o \
	inline_data.o \
	inode.o \
	io_manager.o \
	ismounted.o \
	link.o \
	llseek.o \
	lookup.o \
	mkdir.o \
	mkjournal.o \
	mmp.o \
	namei.o \
	native.o \
	newdir.o \
	openfs.o \
	progress.o \
	punch.o \
	qcow2.o \
	read_bb.o \
	read_bb_file.o \
	res_gdt.o \
	rw_bitmaps.o \
	sha512.o \
	swapfs.o \
	symlink.o \
	tdb.o \
	undo_io.o \
	unix_io.o \
	unlink.o \
	valid_blk.o \
	version.o \
	rbtree.o
CLEAN_FILES = ext2_err.et ext2_types.h crc32c_table.h ext2_err.c ext2_err.h
CFLAGS = -I. -I../ -I../../intl -DHAVE_CONFIG_H
CPPFLAGS =

include $(ROOT)/mk/lib.mk

deps: ext2_err.et ext2_types.h crc32c_table.h ext2_err.c ext2_err.h

ext2_err.et: ext2_err.et.in
	@../../util/subst -f ../../util/subst.conf ext2_err.et.in ext2_err.et

ext2_types.h: ext2_types.h.in
	@cp ext2_types.h.in ext2_types.h

ext2_err.c ext2_err.h: ext2_err.et
	@DIR=../et ../et/compile_et ext2_err.et

crc32c_table.h: gen_crc32ctable
	@./gen_crc32ctable > crc32c_table.h
