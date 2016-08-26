
# Customize below to fit your system.
GROUP = utmp

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

# flags
CPPFLAGS += -D_XOPEN_SOURCE=600 -DVERSION=\"${VERSION}\"

# Objects

OBJS = utmp.o posix.o

