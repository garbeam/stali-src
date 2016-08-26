all: options deps $(LIBS) $(LIB)

options:
	@echo $(LIB) build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "CPPFLAGS = $(CPPFLAGS)"
	@echo "AR       = $(AR)"

.c.o:
	@echo CC $< 
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

.cc.o:
	@echo CXX $< 
	@$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

$(LIB): $(OBJS)
	@echo AR $@
	@$(AR) cr $@ $(OBJS)
	@$(RANLIB) $@

clean:
	@echo cleaning
	@rm -f $(LIB) $(OBJS) $(CLEAN_FILES)

install: all preinst postinst

preinst:
#	@if test "$(LIB_INST)" != ""; then\
#		echo installing library file to $(DESTDIR)$(PREFIX)/lib ;\
#		mkdir -p $(DESTDIR)$(PREFIX)/lib ;\
#		cp -f $(LIB) $(DESTDIR)$(PREFIX)/lib/$(LIB_INST) ;\
#	fi


uninstall: preuninst postuninst

preuninst:
#	@if test "$(LIB_INST)" != ""; then\
#		echo removing library file from $(DESTDIR)$(PREFIX)/lib; \
#		rm -f $(DESTDIR)$(PREFIX)/lib/$(LIB_INST); \
#	fi

.PHONY: deps options clean install preinst postinst uninstall preuninst postuninst
