ROOT=../../..

include $(ROOT)/config.mk

CFLAGS += -I. -I../include 
CPPFLAGS += -DHAVE_CONFIG_H -D_GNU_SOURCE -DNDEBUG -DLINT
OBJS = tty/hardscroll.o \
	tty/hashmap.o \
	base/lib_addch.o \
	base/lib_addstr.o \
	base/lib_beep.o \
	base/lib_bkgd.o \
	base/lib_box.o \
	base/lib_chgat.o \
	base/lib_clear.o \
	base/lib_clearok.o \
	base/lib_clrbot.o \
	base/lib_clreol.o \
	base/lib_color.o \
	base/lib_colorset.o \
	base/lib_delch.o \
	base/lib_delwin.o \
	base/lib_echo.o \
	base/lib_endwin.o \
	base/lib_erase.o \
	base/lib_flash.o \
	./lib_gen.o \
	base/lib_getch.o \
	base/lib_getstr.o \
	base/lib_hline.o \
	base/lib_immedok.o \
	base/lib_inchstr.o \
	base/lib_initscr.o \
	base/lib_insch.o \
	base/lib_insdel.o \
	base/lib_insnstr.o \
	base/lib_instr.o \
	base/lib_isendwin.o \
	base/lib_leaveok.o \
	base/lib_mouse.o \
	base/lib_move.o \
	tty/lib_mvcur.o \
	base/lib_mvwin.o \
	base/lib_newterm.o \
	base/lib_newwin.o \
	base/lib_nl.o \
	base/lib_overlay.o \
	base/lib_pad.o \
	base/lib_printw.o \
	base/lib_redrawln.o \
	base/lib_refresh.o \
	base/lib_restart.o \
	base/lib_scanw.o \
	base/lib_screen.o \
	base/lib_scroll.o \
	base/lib_scrollok.o \
	base/lib_scrreg.o \
	base/lib_set_term.o \
	base/lib_slk.o \
	base/lib_slkatr_set.o \
	base/lib_slkatrof.o \
	base/lib_slkatron.o \
	base/lib_slkatrset.o \
	base/lib_slkattr.o \
	base/lib_slkclear.o \
	base/lib_slkcolor.o \
	base/lib_slkinit.o \
	base/lib_slklab.o \
	base/lib_slkrefr.o \
	base/lib_slkset.o \
	base/lib_slktouch.o \
	base/lib_touch.o \
	trace/lib_tracedmp.o \
	trace/lib_tracemse.o \
	tty/lib_tstp.o \
	base/lib_ungetch.o \
	tty/lib_vidattr.o \
	base/lib_vline.o \
	base/lib_wattroff.o \
	base/lib_wattron.o \
	base/lib_winch.o \
	base/lib_window.o \
	base/nc_panel.o \
	base/safe_sprintf.o \
	tty/tty_update.o \
	trace/varargs.o \
	base/vsscanf.o \
	base/lib_freeall.o \
	./expanded.o \
	base/legacy_coding.o \
	base/lib_dft_fgbg.o \
	tinfo/lib_print.o \
	base/resizeterm.o \
	trace/trace_xnames.o \
	tinfo/use_screen.o \
	base/use_window.o \
	base/wresize.o \
	tinfo/access.o \
	tinfo/add_tries.o \
	tinfo/alloc_ttype.o \
	./codes.o \
	./comp_captab.o \
	tinfo/comp_error.o \
	tinfo/comp_hash.o \
	tinfo/db_iterator.o \
	tinfo/doalloc.o \
	tinfo/entries.o \
	./fallback.o \
	tinfo/free_ttype.o \
	tinfo/getenv_num.o \
	tinfo/home_terminfo.o \
	tinfo/init_keytry.o \
	tinfo/lib_acs.o \
	tinfo/lib_baudrate.o \
	tinfo/lib_cur_term.o \
	tinfo/lib_data.o \
	tinfo/lib_has_cap.o \
	tinfo/lib_kernel.o \
	./lib_keyname.o \
	tinfo/lib_longname.o \
	tinfo/lib_napms.o \
	tinfo/lib_options.o \
	tinfo/lib_raw.o \
	tinfo/lib_setup.o \
	tinfo/lib_termcap.o \
	tinfo/lib_termname.o \
	tinfo/lib_tgoto.o \
	tinfo/lib_ti.o \
	tinfo/lib_tparm.o \
	tinfo/lib_tputs.o \
	trace/lib_trace.o \
	trace/lib_traceatr.o \
	trace/lib_tracebits.o \
	trace/lib_tracechr.o \
	tinfo/lib_ttyflags.o \
	tty/lib_twait.o \
	tinfo/name_match.o \
	./names.o \
	tinfo/obsolete.o \
	tinfo/read_entry.o \
	tinfo/read_termcap.o \
	tinfo/strings.o \
	trace/trace_buf.o \
	trace/trace_tries.o \
	base/tries.o \
	tinfo/trim_sgr0.o \
	./unctrl.o \
	trace/visbuf.o \
	tinfo/alloc_entry.o \
	tinfo/captoinfo.o \
	tinfo/comp_expand.o \
	tinfo/comp_parse.o \
	tinfo/comp_scan.o \
	tinfo/parse_entry.o \
	tinfo/write_entry.o \
	base/define_key.o \
	tinfo/hashed_db.o \
	base/key_defined.o \
	base/keybound.o \
	base/keyok.o \
	base/version.o

LIB = ../libncurses.a
CLEAN_FILES = *.c init_keytry.h ../include/ncurses_def.h ../include/curses.h ../include/term.h ../include/hashsize.h

include $(ROOT)/mk/lib.mk

deps: init_keytry.h ../include/ncurses_def.h ../include/curses.h ../include/term.h ../include/hashsize.h

init_keytry.h:
	@cp init_keytry.stali init_keytry.h

../include/ncurses_def.h:
	@cp ../include/ncurses_def.stali ../include/ncurses_def.h

../include/curses.h:
	@cp ../include/curses.stali ../include/curses.h

../include/term.h:
	@cp ../include/term.stali ../include/term.h

../include/hashsize.h:
	@cp ../include/hashsize.stali ../include/hashsize.h

lib_gen.c:
	@cp lib_gen.stali lib_gen.c

expanded.c:
	@cp expanded.stali expanded.c

codes.c:
	@cp codes.stali codes.c

comp_captab.c:
	@cp comp_captab.stali comp_captab.c

fallback.c:
	@cp fallback.stali fallback.c

lib_keyname.c:
	@cp lib_keyname.stali lib_keyname.c

names.c:
	@cp names.stali names.c

unctrl.c:
	@cp unctrl.stali unctrl.c
