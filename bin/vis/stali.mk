ROOT=../..

include $(ROOT)/config.mk

VERSION = 0.2
CFLAGS += -std=c99 -I$(ROOT)/lib/ncurses/include -I$(ROOT)/lib/libtermkey
CPPFLAGS +=  -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DNDEBUG -DVERSION=\"$(VERSION)\"
BIN = vis
CLEAN_FILES = config.h
LDFLAGS += $(ROOT)/lib/ncurses/libncurses.a $(ROOT)/lib/libtermkey/libtermkey.a
OBJS = array.o\
	buffer.o\
	libutf.o\
	main.o\
	map.o\
	register.o\
	ring-buffer.o\
	text.o\
	text-motions.o\
	text-objects.o\
	text-regex.o\
	text-util.o\
	ui-curses.o\
	view.o\
	vis.o\
	vis-cmds.o\
	vis-lua.o\
	vis-modes.o\
	vis-motions.o\
	vis-operators.o\
	vis-prompt.o\
	vis-text-objects.o

include $(ROOT)/mk/bin.mk

deps: config.h

config.h:
	cp config.def.h config.h

postinst:
	@cp -f vis-open $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/vis-open
	@cp -f vis-clipboard $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/vis-clipboard

postuninst:
	@cd $(DESTDIR)$(PREFIX)/bin && rm vis-open
	@cd $(DESTDIR)$(PREFIX)/bin && rm vis-clipboard




