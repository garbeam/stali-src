ROOT=../../..

include $(ROOT)/config.mk

CPPFLAGS += -DDIFFH=\"$(PREFIX)/bin/diffh\"
CFLAGS += -I../libcommon
LDFLAGS += -L../libcommon -lcommon
BIN = diff
DEPS = diffh
OBJS = diff.o diffdir.o diffreg.o diffver.o
CLEAN_FILES = diffh diffh.o

include $(ROOT)/mk/bin.mk

diffh: diffh.o
	@echo LD $@
	@echo $(CC) -o $@ diffh.o $(LDFLAGS)
	@$(CC) -o $@ diffh.o $(LDFLAGS)

postinst:
	@cp -f diffh $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/diffh

postuninst:
	@rm -f $(DESTDIR)$(PREFIX)/bin/diffh

