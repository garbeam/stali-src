# smdev version
VERSION = 0.2.3

# paths
PREFIX = /usr/local

CC = cc
LD = $(CC)
CPPFLAGS = -D_BSD_SOURCE -D_GNU_SOURCE
CFLAGS   = -std=c99 -Wall -pedantic $(CPPFLAGS)
LDFLAGS  = -s
