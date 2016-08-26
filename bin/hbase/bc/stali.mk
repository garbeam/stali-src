ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I../libcommon -I../libuxre -DUXRE -DDC=\"$(PREFIX)/bin/dc\" -DLIBB=\"$(PREFIX)/bin/bc-lib.b\"
LDFLAGS += -L../libcommon -lcommon -L../libuxre -luxre
BIN = bc
OBJS = bc.o
CLEAN_FILES = bc.c y.tab.c y.tab.h

include $(ROOT)/mk/bin.mk

deps:

bc.c: bc.y
	@echo YACC -d bc.y
	@$(YACC) -d bc.y
	@sed -f yyval.sed <y.tab.c >$@
	@rm y.tab.c

postinst:
	@cp -f lib.b $(DESTDIR)$(PREFIX)/bin/bc-lib.b

postuninst:
	@rm -f $(DESTDIR)$(PREFIX)/bin/bc-lib.b

