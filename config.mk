# stali version
VERSION = 0.0

# define target and target rootfs
HOST_ARCH = x86_64-linux-musl

# OBJTYPE used for 9base getcallerpc_*, there must be a better way...
TARGET_ARCH = $(HOST_ARCH)
OBJTYPE     = x86_64
TARGET_LONG = 8
SYS         = sys.x86_64
DESTDIR     = $(HOME)/rootfs-x86_64

#TARGET_ARCH = arm-linux-musleabi
#OBJTYPE     = arm
#TARGET_LONG = 4
#SYS         = sys.pi
#DESTDIR     = $(HOME)/rootfs-pi

PREFIX = /
MANPREFIX = $(PREFIX)/share/man

M4     = m4
HOSTCC = $(ROOT)/../toolchain/bin/$(HOST_ARCH)-gcc
CC     = $(ROOT)/../toolchain/bin/$(TARGET_ARCH)-gcc
CXX    = $(ROOT)/../toolchain/bin/$(TARGET_ARCH)-g++
AS     = $(ROOT)/../toolchain/bin/$(TARGET_ARCH)-as
LD     = $(CC)

YACC       = $(ROOT)/bin/hbase/yacc/yacc
HOSTAR     = $(ROOT)/../toolchain/bin/$(HOST_ARCH)-ar
AR         = $(ROOT)/../toolchain/bin/$(TARGET_ARCH)-ar
HOSTRANLIB = $(ROOT)/../toolchain/bin/$(HOST_ARCH)-ranlib
RANLIB     = $(ROOT)/../toolchain/bin/$(TARGET_ARCH)-ranlib

HOSTCPPFLAGS = -D_POSIX_SOURCE -D__stali__ -DTARGET_LONG=$(TARGET_LONG)
CPPFLAGS     = $(HOSTCPPFLAGS)
HOSTCFLAGS   = -I$(ROOT)/../toolchain/$(HOST_ARCH)/include
CFLAGS       = -I$(ROOT)/../toolchain/$(TARGET_ARCH)/include
CXXFLAGS     = -I$(ROOT)/../toolchain/$(TARGET_ARCH)/include
HOSTLDFLAGS  = -static
LDFLAGS      = $(HOSTLDFLAGS)
