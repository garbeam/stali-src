ROOT=../../../..

include $(ROOT)/config.mk

LIB = ../libe2p.a
LIB_INST =
OBJS=		feature.o fgetflags.o fsetflags.o fgetversion.o fsetversion.o \
		getflags.o getversion.o hashstr.o iod.o ls.o mntopts.o \
		parse_num.o pe.o pf.o ps.o setflags.o setversion.o uuid.o \
		ostype.o percent.o crypto_mode.o
CLEAN_FILES = 
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

