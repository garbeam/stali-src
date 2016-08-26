ROOT=../../..

include $(ROOT)/config.mk

DATADIR = $(PREFIX)/share
LOCALEDIR = $(DATADIR)/locale
CFLAGS += -Ilibkeymap -Ilibkeymap/keymap -g -O2 -Wall -Wextra -Wmissing-noreturn -Wdisabled-optimization -Wcast-align -Wshadow -Wmissing-format-attribute -Wmissing-prototypes -Wstrict-prototypes -Wmissing-declarations
CPPFLAGS += -DDATADIR=\"$(DATADIR)\" -DLOCALEDIR=\"$(LOCALEDIR)\" -D_BSD_SOURCE -U_GNU_SOURCE -D_FORTIFY_SOURCE=2 -funit-at-a-time

LIBCOMMON = libcommon.a
LIBCOMMONOBJ =\
	mapscrn.o\
	getfd.o\
	xmalloc.o

LIBFONT = libfont.a
LIBFONTOBJ =\
	psffontop.o\
	utf8.o\
	kdmapop.o\
	loadunimap.o\
	kdfontop.o

LIB = $(LIBCOMMON) $(LIBFONT)

BIN =\
	dumpkeys\
	loadkeys\
	showkey\
	setfont\
	showconsolefont\
	setleds\
	setmetamode\
	kbd_mode\
	psfxtable\
	fgconsole\
	kbdrate\
	chvt\
	deallocvt\
	openvt

OBJ = $(BIN:=.o) $(LIBCOMMONOBJ) $(LIBFONTOBJ)
SRC = $(BIN:=.c)

all: $(BIN)

$(BIN): $(LIB) $(OBJ)
	@echo LD $@
	@$(LD) $(LDFLAGS) -o $@ $@.o $(LIB) libkeymap/libkeymap.a

.c.o:
	@echo CC $<
	@$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

$(LIBCOMMON): $(LIBCOMMONOBJ)
	@$(AR) rc $@ $?
	@$(RANLIB) $@

$(LIBFONT): $(LIBFONTOBJ)
	@$(AR) rc $@ $?
	@$(RANLIB) $@

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	cd $(DESTDIR)$(PREFIX)/bin && chmod 755 $(BIN)

uninstall:
	cd $(DESTDIR)$(PREFIX)/bin && rm -f $(BIN)
	cd $(DESTDIR)$(MANPREFIX)/man1 && rm -f $(MAN)

clean:
	rm -f $(BIN) $(OBJ) $(LIB)

.PHONY:
	all install uninstall clean
