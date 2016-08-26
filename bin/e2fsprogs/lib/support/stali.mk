ROOT=../../../..

include $(ROOT)/config.mk

LIB = ../libsupport.a
LIB_INST =
OBJS=		mkquota.o \
		plausible.o \
		profile.o \
		profile_helpers.o \
		prof_err.o \
		quotaio.o \
		quotaio_v2.o \
		quotaio_tree.o \
		dict.o
CLEAN_FILES = prof_err.c prof_err.h
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

deps: prof_err.c prof_err.h

prof_err.c prof_err.h: prof_err.et
	@DIR=../et ../et/compile_et prof_err.et
