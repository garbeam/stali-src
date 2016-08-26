ROOT=../..

include $(ROOT)/config.mk

CFLAGS = -I./
CPPFLAGS = -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN
LIB = libz.a
#LIB_INST = libz.a
OBJZ = adler32.o crc32.o deflate.o infback.o inffast.o inflate.o inftrees.o trees.o zutil.o
OBJG = compress.o uncompr.o gzclose.o gzlib.o gzread.o gzwrite.o
OBJS = $(OBJZ) $(OBJG)
CLEAN_FILES = 

include $(ROOT)/mk/lib.mk

#postinst: zlib.h
#	@echo installing include file to $(DESTDIR)$(PREFIX)/include
#	@mkdir -p $(DESTDIR)$(PREFIX)/include
#	@cp -f zlib.h $(DESTDIR)$(PREFIX)/include/zlib.h

#postuninst:
#	@echo uninstalling include file from $(DESTDIR)$(PREFIX)/include
#	@rm -f $(DESTDIR)$(PREFIX)/include/zlib.h


