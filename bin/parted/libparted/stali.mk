ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I. -I../lib -I../include -Ilabels -I../../e2fsprogs/lib
CPPFLAGS += 
#fs/xfs/xfs.o\

OBJS = cs/constraint.o\
	cs/geom.o\
	cs/natmath.o\
	fs/ntfs/ntfs.o\
	fs/reiserfs/reiserfs.o\
	fs/linux_swap/linux_swap.o\
	fs/jfs/jfs.o\
	fs/r/filesys.o\
	fs/r/fat/count.o\
	fs/r/fat/clstdup.o\
	fs/r/fat/context.o\
	fs/r/fat/resize.o\
	fs/r/fat/bootsector.o\
	fs/r/fat/traverse.o\
	fs/r/fat/calc.o\
	fs/r/fat/table.o\
	fs/r/fat/fatio.o\
	fs/r/fat/fat.o\
	fs/r/hfs/file.o\
	fs/r/hfs/advfs_plus.o\
	fs/r/hfs/hfs.o\
	fs/r/hfs/cache.o\
	fs/r/hfs/probe.o\
	fs/r/hfs/advfs.o\
	fs/r/hfs/journal.o\
	fs/r/hfs/file_plus.o\
	fs/r/hfs/reloc.o\
	fs/r/hfs/reloc_plus.o\
	fs/ext2/interface.o\
	fs/amiga/a-interface.o\
	fs/amiga/amiga.o\
	fs/amiga/apfs.o\
	fs/amiga/affs.o\
	fs/amiga/asfs.o\
	fs/fat/bootsector.o\
	fs/fat/fat.o\
	fs/nilfs2/nilfs2.o\
	fs/hfs/hfs.o\
	fs/hfs/probe.o\
	fs/btrfs/btrfs.o\
	fs/ufs/ufs.o\
	unit.o\
	architecture.o\
	filesys.o\
	exception.o\
	timer.o\
	disk.o\
	debug.o\
	arch/linux.o\
	labels/dos.o\
	labels/gpt.o\
	labels/pt-tools.o\
	labels/dvh.o\
	labels/aix.o\
	labels/pc98.o\
	labels/rdb.o\
	labels/mac.o\
	labels/loop.o\
	labels/sun.o\
	labels/efi_crc32.o\
	labels/bsd.o\
	device.o\
	libparted.o
LIB = libparted.a

include $(ROOT)/mk/lib.mk
