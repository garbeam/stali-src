ROOT=../../..

include $(ROOT)/config.mk

all:

clean:

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/share/consolefonts
	cp -r consolefonts_Z/* $(DESTDIR)$(PREFIX)/share/consolefonts
	mkdir -p $(DESTDIR)$(PREFIX)/share/consolefonts/partialfonts
	cp -r partialfonts_Z/* $(DESTDIR)$(PREFIX)/share/consolefonts/partialfonts
	mkdir -p $(DESTDIR)$(PREFIX)/share/consoletrans
	cp -r ./consoletrans/* $(DESTDIR)$(PREFIX)/share/consoletrans
	mkdir -p $(DESTDIR)$(PREFIX)/share/unimaps
	cp -r ./unimaps/* $(DESTDIR)$(PREFIX)/share/unimaps
	mkdir -p $(DESTDIR)$(PREFIX)/share/keymaps
	mkdir -p $(DESTDIR)$(PREFIX)/share/keymaps/i386
	mkdir -p $(DESTDIR)$(PREFIX)/share/keymaps/mac
	for i in include sun amiga atari i386/azerty i386/bepo i386/dvorak i386/fgGIod i386/qwerty i386/qwertz i386/include i386/olpc i386/colemak mac/include mac/all; do \
	   mkdir -p $(DESTDIR)$(PREFIX)/share/keymaps/$i ;\
	   cp -r keymaps_Z/$i/* $(DESTDIR)$(PREFIX)/share/keymaps/$i ;\
	done

uninstall:
	cd $(DESTDIR)/$(PREFIX)/share && rm -rf consolefonts partialfonts consoletrans unimaps keymaps

.PHONY: all clean install uninstall
