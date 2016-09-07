ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DFORMPATH=\"$(PREFIX)/bin/$(BIN)\" 
LDFLAGS += -L. -llex
BIN = lex
OBJS = main.o sub1.o sub2.o sub3.o header.o wcio.o parser.o getopt.o lsearch.o
LOBJS = allprint.o libmain.o reject.o yyless.o yywrap.o allprint_w.o reject_w.o yyless_w.o reject_e.o yyless_e.o
DEPS = liblex.a parser.c
CLEAN_FILES = $(DEPS) $(LOBJS)
WFLAGS = -DEUC -DJLSLEX -DWOPTION
EFLAGS = -DEUC -DJLSLEX -DEOPTION

include $(ROOT)/mk/bin.mk

liblex.a: $(LOBJS)
	@echo AR $@
	@$(AR) cr $@ $(LOBJS)
	@$(RANLIB) $@

parser.c: parser.y
	@echo YACC $<
	@$(YACC) $<
	@mv y.tab.c parser.c

%_w.o: %.c
	@echo CC $@
	@$(CC) -c $< $(CFLAGS) $(CPPFLAGS) $(WFLAGS) -o $@

%_e.o: %.c
	@echo CC $@
	@$(CC) -c $< $(CFLAGS) $(CPPFLAGS) $(EFLAGS) -o $@
