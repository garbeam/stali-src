ROOT=../../..

include $(ROOT)/config.mk

BIN = curl
OBJS = tool_xattr.o\
	tool_helpers.o\
	tool_operate.o\
	tool_dirhie.o\
	tool_easysrc.o\
	tool_homedir.o\
	tool_formparse.o\
	tool_cb_wrt.o\
	tool_cb_prg.o\
	tool_util.o\
	tool_convert.o\
	tool_vms.o\
	tool_mfiles.o\
	tool_setopt.o\
	tool_help.o\
	tool_getpass.o\
	tool_writeenv.o\
	tool_msgs.o\
	tool_panykey.o\
	tool_parsecfg.o\
	tool_cb_see.o\
	tool_main.o\
	tool_strdup.o\
	tool_writeout.o\
	tool_metalink.o\
	tool_urlglob.o\
	slist_wc.o\
	tool_operhlp.o\
	tool_paramhlp.o\
	tool_libinfo.o\
	tool_hugehelp.o\
	tool_doswin.o\
	tool_cb_dbg.o\
	tool_bname.o\
	tool_cb_rea.o\
	tool_binmode.o\
	tool_cfgable.o\
	tool_getparam.o\
	tool_sleep.o\
	tool_cb_hdr.o\
	../lib/strtoofft.o\
	../lib/rawstr.o\
	../lib/nonblock.o\
	../lib/warnless.o
CLEAN_FILES =  tool_hugehelp.c
CPPFLAGS += -DHAVE_CONFIG_H -DHAVE_FSETXATTR
CFLAGS = -I../lib -I../include -I$(ROOT)/lib/zlib
LDFLAGS += ../lib/libcurl.a $(ROOT)/lib/zlib/libz.a $(ROOT)/lib/libressl/ssl/libssl.a $(ROOT)/lib/libressl/crypto/libcrypto.a

include $(ROOT)/mk/bin.mk

tool_hugehelp.c:
	@cp -f tool_hugehelp.stali tool_hugehelp.c


