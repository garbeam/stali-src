ROOT=../../..

include $(ROOT)/config.mk

DATADIR = $(PREFIX)/share
TABSETDIR = $(DATADIR)/tabset
TICDIR = $(DATADIR)/terminfo
TICFILE = $(TICDIR).db
SRC = terminfo.src

all: terminfo.tmp

terminfo.tmp: run_tic.sed $(SRC)
	@echo '** adjusting tabset paths'
	@sed -f run_tic.sed $(SRC) >terminfo.tmp

run_tic.sed:
	WHICH_XTERM=xterm-new \
	XTERM_KBS=BS \
	datadir=$(DATADIR) \
	$(SHELL) ./gen_edit.sh >$@

install: all
	@mkdir -p $(DESTDIR)$(TABSETDIR) 
	@mkdir -p $(DESTDIR)$(TICDIR) 
	DESTDIR=$(DESTDIR) \
	prefix=$(PREFIX) \
	exec_prefix= \
	bindir=/bin \
	top_srcdir=$(ROOT)/lib/ncurses \
	srcdir=$(ROOT)/lib/ncurses/misc \
	datadir=$(DATADIR) \
	ticdir=$(TICDIR) \
	source=terminfo.tmp \
	cross_compiling=no \
	$(SHELL) ./run_tic.sh
	@cd tabset && \
		$(SHELL) -c 'for i in * ; do \
			if test -f $$i ; then \
			echo installing $$i; \
			cp $$i $(DESTDIR)$(TABSETDIR)/$$i; \
			chmod 644 $(DESTDIR)$(TABSETDIR)/$$i; \
			fi; done'

clean:
	@rm -f terminfo.tmp
	@rm -f run_tic.sed
	@rm -f $(DESTDIR)$(PREFIX)/lib/terminfo

uninstall:
	@rm -rf $(DESTDIR)$(TABSETDIR)
	@rm -rf $(DESTDIR)$(TICDIR)

