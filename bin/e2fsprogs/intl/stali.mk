ROOT=../../..

include $(ROOT)/config.mk

LIB = libintl.a
OBJS = \
  bindtextdom.o \
  dcgettext.o \
  dgettext.o \
  gettext.o \
  finddomain.o \
  loadmsgcat.o \
  localealias.o \
  textdomain.o \
  l10nflist.o \
  explodename.o \
  dcigettext.o \
  dcngettext.o \
  dngettext.o \
  ngettext.o \
  plural.o \
  plural-exp.o \
  localcharset.o \
  relocatable.o \
  localename.o \
  log.o \
  printf.o \
  osdep.o \
  intl-compat.o
CLEAN_FILES = libgnuintl.h
CPPFLAGS += -DLOCALE_ALIAS_PATH=\"$(PREFIX)share/locale\" -DLIBDIR=\"$(PREFIX)lib\" -DIN_LIBINTL -DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"$(PREFIX)lib\" -DNO_XMALLOC -Dset_relocation_prefix=libintl_set_relocation_prefix -Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H
CFLAGS += -I. -I.. -I../lib

include $(ROOT)/mk/lib.mk

deps: libgnuintl.h

libgnuintl.h: libgnuintl.h.in
	@sed -e 's,@''HAVE_POSIX_PRINTF''@,1,g' \
	    -e 's,@''HAVE_ASPRINTF''@,1,g' \
	    -e 's,@''HAVE_SNPRINTF''@,1,g' \
	    -e 's,@''HAVE_WPRINTF''@,0,g' \
	  < libgnuintl.h.in > libgnuintl.h 
