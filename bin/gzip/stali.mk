ROOT=../..

include $(ROOT)/config.mk

CFLAGS += -I. -Ilib
CPPFLAGS +=
LIBGZIP = lib/libgzip.a
LIB = $(LIBGZIP)

BIN = gzip
# gunzip zcat zcmp zdiff zegrep zforce zgrep zless zmore znew
OBJ = bits.o\
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

GZIP_OBJS = bits.o\
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
	zip.o\
	version.o

all: $(LIB) $(OBJ) $(BIN)

$(LIBGZIP):
	@cd lib; $(MAKE) -f stali.mk;

gzip: $(LIB) $(OBJ)
	@echo LD $@
	@$(LD) $(LDFLAGS) -o $@ $(GZIP_OBJS) $(LIB) lib/libgzip.a

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
	rm -f $(BIN) $(OBJ) $(LIB)
	@cd lib; $(MAKE) -f stali.mk clean;

.PHONY:
	all install uninstall clean
