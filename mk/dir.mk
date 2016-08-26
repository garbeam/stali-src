PWD = $(shell pwd)

all:
	@for i in $(SUBDIRS); do cd $$i; $(MAKE) -f stali.mk || exit; cd $(PWD); done;
	@echo done

clean:
	@for i in $(SUBDIRS); do cd $$i; $(MAKE) -f stali.mk clean || exit; cd $(PWD); done
	@echo cleaned 

install: all
	@for i in $(SUBDIRS); do cd $$i; $(MAKE) -f stali.mk install || exit; cd $(PWD); done
	@echo installed 

uninstall:
	@for i in $(SUBDIRS); do cd $$i; $(MAKE) -f stali.mk uninstall || exit; cd $(PWD); done
	@echo uninstalled 

.PHONY:
	info all install uninstall clean

