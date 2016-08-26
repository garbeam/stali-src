ROOT=../..

include $(ROOT)/config.mk

CPPFLAGS = -D_BSD_SOURCE
OBJS = sdhcp.o util/eprintf.o util/strlcpy.o
BIN = sdhcp

include $(ROOT)/mk/bin.mk
