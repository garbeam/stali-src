ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -D_GNU_SOURCE -DHAVE_SETNS -D_LINUX_IN6_H
CFLAGS += -I../include -I$(ROOT)/sys/usr/include 
OBJS = utils.o rt_names.o ll_types.o ll_proto.o ll_addr.o \
	dnet_ntop.o dnet_pton.o inet_proto.o namespace.o\
	ipx_ntop.o mpls_ntop.o mpls_pton.o json_writer.o \
	names.o color.o libgenl.o ll_map.o libnetlink.o
LIB = libiproute2.a
LIB_INST = 

include $(ROOT)/mk/lib.mk
