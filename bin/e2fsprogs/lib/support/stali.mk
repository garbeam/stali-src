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
DEPS = prof_err.c prof_err.h
CLEAN_FILES = $(DEPS) _prof_err
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

prof_err.c prof_err.h: _prof_err ;

_prof_err: prof_err.et
	@DIR=../et ../et/compile_et prof_err.et
	@touch $@
