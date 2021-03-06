ROOT=../..

include $(ROOT)/config.mk

CPPFLAGS += -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700

HDR =\
	arg.h\
	compat.h\
	crypt.h\
	fs.h\
	md5.h\
	queue.h\
	sha1.h\
	sha224.h\
	sha256.h\
	sha384.h\
	sha512.h\
	sha512-224.h\
	sha512-256.h\
	text.h\
	utf.h\
	util.h

LIBUTF = libutf.a
LIBUTFSRC =\
	libutf/rune.c\
	libutf/runetype.c\
	libutf/utf.c\
	libutf/utftorunestr.c\
	libutf/fgetrune.c\
	libutf/fputrune.c\
	libutf/isalnumrune.c\
	libutf/isalpharune.c\
	libutf/isblankrune.c\
	libutf/iscntrlrune.c\
	libutf/isdigitrune.c\
	libutf/isgraphrune.c\
	libutf/isprintrune.c\
	libutf/ispunctrune.c\
	libutf/isspacerune.c\
	libutf/istitlerune.c\
	libutf/isxdigitrune.c\
	libutf/lowerrune.c\
	libutf/upperrune.c

LIBUTIL = libutil.a
LIBUTILSRC =\
	libutil/concat.c\
	libutil/cp.c\
	libutil/crypt.c\
	libutil/ealloc.c\
	libutil/enmasse.c\
	libutil/eprintf.c\
	libutil/eregcomp.c\
	libutil/estrtod.c\
	libutil/fnck.c\
	libutil/fshut.c\
	libutil/getlines.c\
	libutil/human.c\
	libutil/linecmp.c\
	libutil/md5.c\
	libutil/memmem.c\
	libutil/mkdirp.c\
	libutil/mode.c\
	libutil/parseoffset.c\
	libutil/putword.c\
	libutil/reallocarray.c\
	libutil/recurse.c\
	libutil/rm.c\
	libutil/sha1.c\
	libutil/sha224.c\
	libutil/sha256.c\
	libutil/sha384.c\
	libutil/sha512.c\
	libutil/sha512-224.c\
	libutil/sha512-256.c\
	libutil/strcasestr.c\
	libutil/strlcat.c\
	libutil/strlcpy.c\
	libutil/strsep.c\
	libutil/strtonum.c\
	libutil/unescape.c

LIB = $(LIBUTF) $(LIBUTIL)

BIN =\
	basename\
	cal\
	cat\
	chgrp\
	chmod\
	chown\
	chroot\
	cksum\
	cmp\
	cols\
	comm\
	cp\
	cron\
	cut\
	date\
	dirname\
	du\
	echo\
	ed\
	env\
	expand\
	expr\
	false\
	find\
	flock\
	fold\
	getconf\
	grep\
	head\
	join\
	hostname\
	kill\
	link\
	ln\
	logger\
	logname\
	ls\
	md5sum\
	mkdir\
	mkfifo\
	mktemp\
	mv\
	nice\
	nl\
	nohup\
	od\
	pathchk\
	paste\
	printenv\
	printf\
	pwd\
	readlink\
	renice\
	rm\
	rmdir\
	sed\
	seq\
	setsid\
	sha1sum\
	sha224sum\
	sha256sum\
	sha384sum\
	sha512sum\
	sha512-224sum\
	sha512-256sum\
	sleep\
	sort\
	split\
	sponge\
	strings\
	sync\
	tail\
	tar\
	tee\
	test\
	tftp\
	time\
	touch\
	tr\
	true\
	tsort\
	tty\
	uname\
	unexpand\
	uniq\
	unlink\
	uudecode\
	uuencode\
	wc\
	which\
	whoami\
	xargs\
	xinstall\
	yes

LIBUTFOBJ = $(LIBUTFSRC:.c=.o)
LIBUTILOBJ = $(LIBUTILSRC:.c=.o)
OBJ = $(BIN:=.o) $(LIBUTFOBJ) $(LIBUTILOBJ)
SRC = $(BIN:=.c)
MAN = $(BIN:=.1)

all: $(BIN)

$(BIN): $(LIB) $(@:=.o)

$(OBJ): $(HDR) config.mk

.o:
	@echo LD $@
	@$(LD) $(LDFLAGS) -o $@ $< $(LIB)

.c.o:
	@echo CC $<
	@$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

$(LIBUTF): $(LIBUTFOBJ)
	$(AR) rc $@ $?
	$(RANLIB) $@

$(LIBUTIL): $(LIBUTILOBJ)
	$(AR) rc $@ $?
	$(RANLIB) $@

getconf.c: confstr_l.h limits_l.h sysconf_l.h pathconf_l.h

confstr_l.h limits_l.h sysconf_l.h pathconf_l.h: _getconf ;
	
_getconf: getconf.sh
	./getconf.sh
	touch $@

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	cd $(DESTDIR)$(PREFIX)/bin && ln -f test [ && chmod 755 $(BIN)
	mv -f $(DESTDIR)$(PREFIX)/bin/xinstall $(DESTDIR)$(PREFIX)/bin/install
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	for m in $(MAN); do sed "s/^\.Os sbase/.Os sbase $(VERSION)/g" < "$$m" > $(DESTDIR)$(MANPREFIX)/man1/"$$m"; done
	cd $(DESTDIR)$(MANPREFIX)/man1 && chmod 644 $(MAN)
	mv -f $(DESTDIR)$(MANPREFIX)/man1/xinstall.1 $(DESTDIR)$(MANPREFIX)/man1/install.1

uninstall:
	cd $(DESTDIR)$(PREFIX)/bin && rm -f $(BIN) [ install
	cd $(DESTDIR)$(MANPREFIX)/man1 && rm -f $(MAN)

clean:
	rm -f $(BIN) $(OBJ) $(LIB) sbase-box sbase-$(VERSION).tar.gz
	rm -f confstr_l.h limits_l.h sysconf_l.h pathconf_l.h _getconf

.PHONY:
	all install uninstall clean
