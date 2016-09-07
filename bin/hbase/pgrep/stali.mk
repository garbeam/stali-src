ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = pgrep
OBJS = pgrep.o

include $(ROOT)/mk/bin.mk

postinst:
	@cd $(DESTDIR)$(PREFIX)/bin && ln -sf $(BIN) pkill
	@cd $(DESTDIR)$(MANPREFIX)/man1 && ln -sf $(BIN).1 pkill.1

postuninst:
	@rm -f $(DESTDIR)$(PREFIX)/bin/pkill
	@rm -f $(DESTDIR)$(MANPREFIX)/man1/pkill.1
