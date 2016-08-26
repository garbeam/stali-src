ROOT=../../..

include $(ROOT)/config.mk

CFLAGS = -I../include -I. -I../include/compat
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -D_GNU_SOURCE
OBJS = tls_config.o\
	tls_util.o\
	tls_conninfo.o\
	tls_client.o\
	tls_server.o\
	tls_verify.o\
	tls_peer.o\
	tls.o
LIB = libtls.a

include $(ROOT)/mk/lib.mk
