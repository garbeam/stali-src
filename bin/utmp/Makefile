# utmp - simple login
# See LICENSE file for copyright and license details.

include config.mk

DIST    = LICENSE Makefile config.mk utmp.1 utmp.c bsd.c posix.c
VERSION = 0.2

all: options utmp

options:
	@echo utmp build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "CPPFLAGS = ${CPPFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "LDLIBS	= ${LDLIBS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} $(CFLAGS) $(CPPFLAGS) -c $<

utmp: $(OBJS)
	@echo CC -o $@
	@$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $@

distclean: clean
	@echo cleaning for distribution
	@rm config.mk
clean:
	@echo cleaning
	@rm -f utmp utmp-${VERSION}.tar.gz *.o

dist: clean
	@echo creating dist tarball
	@mkdir -p utmp-${VERSION}
	@cp -R $(DIST) utmp-${VERSION}
	@tar -cf -  utmp-${VERSION} | gzip > utmp-${VERSION}.tar.gz
	@rm -rf utmp-${VERSION}

install: all
	@echo installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f utmp ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/utmp
	@chgrp ${GROUP} ${DESTDIR}${PREFIX}/bin/utmp
	@chmod g+s ${DESTDIR}${PREFIX}/bin/utmp
	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < utmp.1 > ${DESTDIR}${MANPREFIX}/man1/utmp.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/utmp.1

uninstall:
	@echo removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/utmp
	@echo removing manual page from ${DESTDIR}${PREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/utmp.1

.PHONY: options clean dist install uninstall
