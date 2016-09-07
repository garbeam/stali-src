ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -DDC=\"$(PREFIX)/bin/dc\" -DLIBB=\"$(PREFIX)/bin/bc-lib.b\"
BIN = bc
OBJS = bc.o
CLEAN_FILES = bc.c

include $(ROOT)/mk/bin.mk

bc.c: bc.y
	@echo YACC bc.y
	@$(YACC) bc.y
	@sed -f yyval.sed y.tab.c >$@
	@rm y.tab.c

postinst:
	@cp -f lib.b $(DESTDIR)$(PREFIX)/bin/bc-lib.b

postuninst:
	@rm -f $(DESTDIR)$(PREFIX)/bin/bc-lib.b

