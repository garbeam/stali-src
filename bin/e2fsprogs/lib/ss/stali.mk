ROOT=../../../..

include $(ROOT)/config.mk

LIB = ../libss.a
LIB_INST = 
OBJS=	ss_err.o \
	std_rqs.o \
	invocation.o help.o \
	execute_cmd.o listen.o parse.o error.o prompt.o \
	request_tbl.o list_rqs.o pager.o requests.o \
	data.o get_readline.o
CLEAN_FILES = ss_err.c ss_err.h std_rqs.c mk_cmds _ss_err
CFLAGS += -I../

include $(ROOT)/mk/lib.mk

ss_err.c ss_err.h: _ss_err ;
	
_ss_err: ss_err.et
	@DIR=../et ../et/compile_et ss_err.et
	@touch $@

std_rqs.c: std_rqs.ct mk_cmds
	@DIR=. ./mk_cmds std_rqs.ct

mk_cmds: mk_cmds.sh.in
	@../../util/subst -f ../../util/subst.conf mk_cmds.sh.in mk_cmds
	@chmod +x mk_cmds
