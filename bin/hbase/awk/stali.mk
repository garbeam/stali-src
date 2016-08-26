ROOT=../../..

include $(ROOT)/config.mk

BIN = awk
OBJS = ytab.o lex.o b.o main.o parse.o proctab.o tran.o lib.o run.o
CLEAN_FILES = ytab.c ytab.h proctab.c gen/maketab
LDFLAGS += -lm

include $(ROOT)/mk/bin.mk

deps: ytab.c proctab.c

ytab.c: ytab

ytab: awkgram.y
	@echo YACC -d awkgram.y
	@$(YACC) -d awkgram.y
	mv y.tab.c ytab.c
	mv y.tab.h ytab.h

proctab.c: gen/maketab
	@echo MAKETAB proctab.c
	@gen/maketab ytab.h >proctab.c

gen/maketab: ytab.h gen/maketab.c
	@echo LD $@
	@$(HOSTCC) gen/maketab.c -o $@ -static
