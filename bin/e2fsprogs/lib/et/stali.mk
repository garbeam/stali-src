ROOT=../../../..

include $(ROOT)/config.mk

LIB = ../libcom_err.a
LIB_INST = 
OBJS= error_message.o et_name.o init_et.o com_err.o com_right.o
DEPS = ../dirpaths.h ../config.h compile_et
CLEAN_FILES = $(DEPS)
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

../dirpaths.h:
	@cp ../dirpaths.h.stali ../dirpaths.h

../config.h:
	@cp ../config.h.stali ../config.h

compile_et: compile_et.sh.in
	@../../util/subst ../../util/subst.conf
	@../../util/subst -f ../../util/subst.conf compile_et.sh.in compile_et
	@chmod +x compile_et
