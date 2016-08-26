all: options deps $(BINS) $(BIN)

options:
	@echo $(BIN) build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "CPPFLAGS = $(CPPFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	@echo CC $< 
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

.cc.o:
	@echo CXX $< 
	@$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

$(BIN): $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(OBJS) $(LDFLAGS)

clean:
	@echo cleaning
	@rm -f $(BINS) $(BIN) $(OBJS) $(CLEAN_FILES)

install: all preinst postinst

preinst:
	@echo installing executable file to $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && chmod 755 $(BIN)
	@if test -f $(BIN).1 ; then\
		echo installing manual page to $(DESTDIR)$(MANPREFIX)/man1;\
		mkdir -p $(DESTDIR)$(MANPREFIX)/man1;\
		sed "s/VERSION/$(VERSION)/g" < $(BIN).1 > $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1;\
		chmod 644 $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1;\
	fi
	@if test -f $(BIN).8 ; then\
		echo installing manual page to $(DESTDIR)$(MANPREFIX)/man8;\
		mkdir -p $(DESTDIR)$(MANPREFIX)/man8;\
		sed "s/VERSION/$(VERSION)/g" < $(BIN).8 > $(DESTDIR)$(MANPREFIX)/man8/$(BIN).8;\
		chmod 644 $(DESTDIR)$(MANPREFIX)/man8/$(BIN).8;\
	fi

uninstall: preuninst postuninst

preuninst:
	@echo removing executable file from $(DESTDIR)$(PREFIX)/bin
	@rm -f $(DESTDIR)$(PREFIX)/bin/$(BIN)
	@if test -f $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1; then\
		echo removing manual page from $(DESTDIR)$(PREFIX)/man1;\
		rm -f $(DESTDIR)$(MANPREFIX)/man1/$(BIN).1;\
	fi
	@if test -f $(DESTDIR)$(MANPREFIX)/man8/$(BIN).8; then\
		echo removing manual page from $(DESTDIR)$(PREFIX)/man8;\
		rm -f $(DESTDIR)$(MANPREFIX)/man8/$(BIN).8;\
	fi

.PHONY: deps options clean install preinst postinst uninstall preuninst postuninst
