ROOT=../../..

include $(ROOT)/config.mk

BIN = awk
OBJS = ytab.o lex.o b.o main.o parse.o proctab.o tran.o lib.o run.o
DEPS = ytab.h
CLEAN_FILES = _ytab ytab.c ytab.h proctab.c gen/maketab
LDFLAGS += -lm

include $(ROOT)/mk/bin.mk

ytab.h ytab.c: _ytab ;

_ytab: awkgram.y
	@echo YACC -d $?
	@$(YACC) -d $?
	mv y.tab.h ytab.h
	mv y.tab.c ytab.c
	touch $@

proctab.c: gen/maketab
	@echo MAKETAB proctab.c
	@gen/maketab ytab.h >proctab.c

gen/maketab: ytab.h gen/maketab.c
	@echo LD $@
	@$(HOSTCC) gen/maketab.c -o $@ -static
