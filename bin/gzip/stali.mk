ROOT=../..

include $(ROOT)/config.mk

CFLAGS += -I. -Ilib
CPPFLAGS +=
LIB = lib/libgzip.a
BIN = gzip
# gunzip zcat zcmp zdiff zegrep zforce zgrep zless zmore znew
OBJS = bits.o\
	deflate.o\
	gzip.o\
	inflate.o\
	lzw.o\
	trees.o\
	unlzh.o\
	unlzw.o\
	unpack.o\
	unzip.o\
	util.o\
	version.o\
	zip.o

all: $(BIN)

$(OBJS): $(LIB)

$(LIB):
	@cd lib && $(MAKE) -f stali.mk

$(BIN): $(OBJS) $(LIB)
	@echo LD $@
	@$(LD) $(LDFLAGS) -o $@ $^

.c.o:
	@echo CC $<
	@$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

install: all
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && chmod 755 $(BIN)
	@echo installing manual page to $(DESTDIR)$(MANPREFIX)/man1
	@mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	@cp -f $(BIN).1 $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1
	@chmod 644 $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1

uninstall:
	@cd $(DESTDIR)$(PREFIX)/bin && rm -f $(BIN)
	@cd $(DESTDIR)$(MANPREFIX)/man1 && rm -f $(BIN).1

clean:
	rm -f $(BIN) $(OBJS) $(LIB)
	@cd lib && $(MAKE) -f stali.mk clean;

.PHONY:
	all install uninstall clean
