ROOT=../../..

include $(ROOT)/config.mk

BINS = subst symlinks
OBJS = $(BINS:=.o)
DEPS = dirpaths.h subst.conf
CLEAN_FILES = $(DEPS) $(BINS)

all: options $(BINS)
$(BINS): $(OBJS)
$(OBJS): $(DEPS)

options:
	@echo build options:
	@echo "HOSTCFLAGS   = $(HOSTCFLAGS)"
	@echo "HOSTCPPFLAGS = $(HOSTCPPFLAGS)"
	@echo "HOSTLDFLAGS  = $(HOSTLDFLAGS)"
	@echo "HOSTCC       = $(HOSTCC)"

dirpaths.h:
	@echo "/* fake dirpaths.h for config.h */" > dirpaths.h

subst.conf:
	@cp subst.conf.stali subst.conf

.c.o:
	@echo HOSTCC $< 
	@$(HOSTCC) $(HOSTCFLAGS) $(HOSTCPPFLAGS) -c $< -o $@

.o:
	@echo HOSTLD $<
	@$(HOSTCC) -o $@ $< $(HOSTLDFLAGS) 

install: all

uninstall:

clean:
	@echo cleaning
	@rm -f $(BIN) $(OBJS) $(CLEAN_FILES)

.PHONY: all options clean install uninstall
