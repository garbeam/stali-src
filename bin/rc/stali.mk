ROOT=../..

include $(ROOT)/config.mk

BIN = rc.init rc.exit

all: $(BIN)

clean:

install: all
	@mkdir -p $(DESTDIR)$(PREFIX)/etc
	@cp -f $(BIN) $(DESTDIR)$(PREFIX)/etc
	@cd $(DESTDIR)$(PREFIX)/etc && chmod 755 $(BIN)

uninstall:
	@cd $(DESTDIR)$(PREFIX)/etc && rm -f $(BIN)

