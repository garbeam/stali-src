all: $(ETC)

install: postinst
postinst: preinst

preinst: all
	@echo installing etc files to $(DESTDIR)/etc
	@mkdir -p $(DESTDIR)/etc
	@cp -f $(ETC) $(DESTDIR)/etc
	@cd $(DESTDIR)/etc && chmod 644 $(ETC)

uninstall: postuninst
postuninst: preuninst

preuninst:
	@echo removing etc files from $(DESTDIR)/etc
	@cd $(DESTDIR)/etc && rm -f $(ETC)

.PHONY: install preinst postinst uninstall preuninst postuninst
