all clean install uninstall:
	$(MAKE) -f stali.mk $(SUBDIRS) TARGET=$@

$(SUBDIRS):
	cd $@ && $(MAKE) -f stali.mk $(TARGET)

.PHONY: all install uninstall clean $(SUBDIRS)
