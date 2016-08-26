all: $(ETC)

install: all preinst postinst

preinst:
	@echo installing etc files to $(DESTDIR)/etc
	@mkdir -p $(DESTDIR)/etc
	@cp -f $(ETC) $(DESTDIR)/etc
	@cd $(DESTDIR)/etc && chmod 644 $(ETC)

uninstall: preuninst postuninst

preuninst:
	@echo removing etc files from $(DESTDIR)/etc
	@cd $(DESTDIR)/etc && rm -f $(ETC)

.PHONY: install preinst postinst uninstall preuninst postuninst
