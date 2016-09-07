ROOT=../../..

include $(ROOT)/config.mk

BIN = _install
OBJS = install.o

include $(ROOT)/mk/bin.mk

postinst:
	@mv $(DESTDIR)$(PREFIX)/bin/$(BIN) $(DESTDIR)$(PREFIX)/bin/install
	@mv $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1 $(DESTDIR)$(MANPREFIX)/man1/install.1

postuninst:
	@rm -f $(DESTDIR)$(PREFIX)/bin/install
	@rm -f $(DESTDIR)$(MANPREFIX)/man1/install.1
