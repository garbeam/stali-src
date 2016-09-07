ROOT=../../..

include $(ROOT)/config.mk

BINS = mke2fs badblocks tune2fs dumpe2fs blkid logsave e2image fsck e2undo\
	mklost+found filefrag e2freefrag uuidd e4defrag e4crypt 
MKE2FS_OBJS=	mke2fs.o util.o default_profile.o mk_hugefiles.o \
			create_inode.o
BADBLOCKS_OBJS=	badblocks.o
TUNE2FS_OBJS=	tune2fs.o util.o
DUMPE2FS_OBJS=	dumpe2fs.o
BLKID_OBJS=	blkid.o
LOGSAVE_OBJS=	logsave.o
E2IMAGE_OBJS=	e2image.o
FSCK_OBJS=	fsck.o base_device.o ismounted.o
E2UNDO_OBJS=	e2undo.o
MKLPF_OBJS=	mklost+found.o
FILEFRAG_OBJS=	filefrag.o
E2FREEFRAG_OBJS= e2freefrag.o
UUIDD_OBJS=	uuidd.o
E4DEFRAG_OBJS=	e4defrag.o
E4CRYPT_OBJS=   e4crypt.o
OBJS = $(MKE2FS_OBJS) $(BADBLOCKS_OBJS) $(TUNE2FS_OBJS) $(DUMPE2FS_OBJS) $(BLKID_OBJS)\
       $(LOGSAVE_OBJS) $(E2IMAGE_OBJS) $(FSCK_OBJS) $(E2UNDO_OBJS) $(MKLPF_OBJS)\
       $(FILEFRAG_OBJS) $(E2FREEFRAG_OBJS) $(UUIDD_OBJS) $(E4DEFRAG_OBJS) $(E4CRYPT_OBJS)
MAN8_INFILES = badblocks.8.in blkid.8.in dumpe2fs.8.in e2freefrag.8.in e2image.8.in e2undo.8.in e4crypt.8.in\
	     e4defrag.8.in filefrag.8.in fsck.8.in logsave.8.in mke2fs.8.in mklost+found.8.in tune2fs.8.in uuidd.8.in
MAN8_FILES = badblocks.8 blkid.8 dumpe2fs.8 e2freefrag.8 e2image.8 e2undo.8 e4crypt.8\
	     e4defrag.8 filefrag.8 fsck.8 logsave.8 mke2fs.8 mklost+found.8 tune2fs.8 uuidd.8
CLEAN_FILES = default_profile.c mke2fs.conf $(BINS)
CPPFLAGS = -DHAVE_CONFIG_H
CFLAGS = -I. -I../lib -I../intl 
LDFLAGS += ../lib/libext2fs.a ../lib/libcom_err.a ../lib/libsupport.a ../lib/libblkid.a ../lib/libuuid.a\
	   ../lib/libuuid.a ../lib/libext2fs.a ../lib/libe2p.a ../intl/libintl.a

all: options $(MAN8_FILES) $(BINS)

options:
	@echo build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "CPPFLAGS = $(CPPFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

mke2fs.conf: mke2fs.conf.in
	@cp mke2fs.conf.in mke2fs.conf;

default_profile.c: mke2fs.conf profile-to-c.awk
	@awk -f profile-to-c.awk < mke2fs.conf > default_profile.c

.c.o:
	@echo CC $< 
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(MAN8_FILES):
	@echo MAN $@ 
	@cp $@.in $@

mke2fs: $(MKE2FS_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(MKE2FS_OBJS) $(LDFLAGS)

badblocks: $(BADBLOCKS_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(BADBLOCKS_OBJS) $(LDFLAGS)

tune2fs: $(TUNE2FS_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(TUNE2FS_OBJS) $(LDFLAGS)

dumpe2fs: $(DUMPE2FS_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(DUMPE2FS_OBJS) $(LDFLAGS)

blkid: $(BLKID_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(BLKID_OBJS) $(LDFLAGS)

logsave: $(LOGSAVE_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LOGSAVE_OBJS) $(LDFLAGS)

e2image: $(E2IMAGE_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(E2IMAGE_OBJS) $(LDFLAGS)

fsck: $(FSCK_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(FSCK_OBJS) $(LDFLAGS)

e2undo: $(E2UNDO_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(E2UNDO_OBJS) $(LDFLAGS)

mklost+found: $(MKLPF_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(MKLPF_OBJS) $(LDFLAGS)

filefrag: $(FILEFRAG_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(FILEFRAG_OBJS) $(LDFLAGS)

e2freefrag: $(E2FREEFRAG_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(E2FREEFRAG_OBJS) $(LDFLAGS)

uuidd: $(UUIDD_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(UUIDD_OBJS) $(LDFLAGS)

e4defrag: $(E4DEFRAG_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(E4DEFRAG_OBJS) $(LDFLAGS)

e4crypt: $(E4CRYPT_OBJS)
	@echo LD $@
	@$(CC) -o $@ $(E4CRYPT_OBJS) $(LDFLAGS)

clean:
	@echo cleaning
	@rm -f $(BIN) $(OBJS) $(CLEAN_FILES) $(MAN8_FILES)

install:
	@echo installing executable file to $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f $(BINS) $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin/ && chmod 755 $(BINS)
	@echo installing manual page to $(DESTDIR)$(MANPREFIX)/man8
	@mkdir -p $(DESTDIR)$(MANPREFIX)/man8
	@cp -f $(MAN8_FILES) $(DESTDIR)$(MANPREFIX)/man8
	@cd $(DESTDIR)$(MANPREFIX)/man8 && chmod 644 $(MAN8_FILES)

uninstall:
	@echo removing executable file from $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && rm -f $(BINS)
	@cd $(DESTDIR)$(MANPREFIX)/man8 && rm -f $(MAN8_FILES)

.PHONY: all options clean install uninstall
