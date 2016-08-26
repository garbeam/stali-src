ROOT=../..

include $(ROOT)/config.mk

CPPFLAGS += -D_XOPEN_SOURCE=600 -DVERSION=\"${VERSION}\"
GROUP = utmp
OBJS = utmp.o posix.o
BIN = utmp

include $(ROOT)/mk/bin.mk

postinst: 
#	@chgrp ${GROUP} ${DESTDIR}${PREFIX}/bin/$(BIN)
#	@chmod g+s ${DESTDIR}${PREFIX}/bin/$(BIN)
