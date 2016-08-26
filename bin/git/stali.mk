ROOT=../..

include $(ROOT)/config.mk

GIT_VERSION = 2.8.0
GIT_USER_AGENT = git/$(GIT_VERSION)
CFLAGS += -I. -I$(ROOT)/lib/libressl/include -I$(ROOT)/lib/zlib -I../curl/include -I$(ROOT)/lib/expat/lib
CPPFLAGS += -DNO_SYS_POLL_H -DGIT_VERSION=\"$(GIT_VERSION)\" -DGIT_USER_AGENT=\"$(GIT_USER_AGENT)\"  \
	-DSHA1_HEADER='<openssl/sha.h>' -DETC_GITCONFIG=\"/etc/gitconfig\" -DETC_GITATTRIBUTES=\"/etc/gitattributes\"\
	-DPREFIX=\"/\" -DGIT_EXEC_PATH=\"/bin\" -DGIT_LOCALE_PATH=\"/share/locale\" -DGIT_MAN_PATH=\"/share/man\" \
	-DGIT_INFO_PATH=\"/share/info\" -DGIT_HTML_PATH=\"/tmp\" -DDEFAULT_GIT_TEMPLATE_DIR=\"/share/git-core/templates\"
LDFLAGS += $(ROOT)/lib/libressl/crypto/libcrypto.a $(ROOT)/lib/libressl/tls/libtls.a\
	$(ROOT)/lib/zlib/libz.a ../curl/lib/libcurl.a $(ROOT)/lib/expat/libexpat.a\
	$(ROOT)/lib/libressl/crypto/libcrypto.a \
	$(ROOT)/lib/libressl/ssl/libssl.a \
	$(ROOT)/lib/libressl/crypto/libcrypto.a \

LIBOBJS = abspath.o\
	advice.o\
	alias.o\
	alloc.o\
	archive.o\
	archive-tar.o\
	archive-zip.o\
	argv-array.o\
	attr.o\
	base85.o\
	bisect.o\
	blob.o\
	branch.o\
	bulk-checkin.o\
	bundle.o\
	cache-tree.o\
	color.o\
	column.o\
	combine-diff.o\
	commit.o\
	compat/obstack.o\
	compat/terminal.o\
	config.o\
	connect.o\
	connected.o\
	convert.o\
	copy.o\
	credential.o\
	csum-file.o\
	ctype.o\
	date.o\
	decorate.o\
	diffcore-break.o\
	diffcore-delta.o\
	diffcore-order.o\
	diffcore-pickaxe.o\
	diffcore-rename.o\
	diff-delta.o\
	diff-lib.o\
	diff-no-index.o\
	diff.o\
	dir.o\
	editor.o\
	entry.o\
	environment.o\
	ewah/bitmap.o\
	ewah/ewah_bitmap.o\
	ewah/ewah_io.o\
	ewah/ewah_rlw.o\
	exec_cmd.o\
	fetch-pack.o\
	fsck.o\
	gettext.o\
	gpg-interface.o\
	graph.o\
	grep.o\
	hashmap.o\
	help.o\
	hex.o\
	ident.o\
	kwset.o\
	levenshtein.o\
	line-log.o\
	line-range.o\
	list-objects.o\
	ll-merge.o\
	lockfile.o\
	log-tree.o\
	mailinfo.o\
	mailmap.o\
	match-trees.o\
	merge.o\
	merge-blobs.o\
	merge-recursive.o\
	mergesort.o\
	name-hash.o\
	notes.o\
	notes-cache.o\
	notes-merge.o\
	notes-utils.o\
	object.o\
	pack-bitmap.o\
	pack-bitmap-write.o\
	pack-check.o\
	pack-objects.o\
	pack-revindex.o\
	pack-write.o\
	pager.o\
	parse-options.o\
	parse-options-cb.o\
	patch-delta.o\
	patch-ids.o\
	path.o\
	pathspec.o\
	pkt-line.o\
	preload-index.o\
	pretty.o\
	prio-queue.o\
	progress.o\
	prompt.o\
	quote.o\
	reachable.o\
	read-cache.o\
	reflog-walk.o\
	refs.o\
	refs/files-backend.o\
	ref-filter.o\
	remote.o\
	replace_object.o\
	rerere.o\
	resolve-undo.o\
	revision.o\
	run-command.o\
	thread-utils.o\
	send-pack.o\
	sequencer.o\
	server-info.o\
	setup.o\
	sha1-array.o\
	sha1-lookup.o\
	sha1_file.o\
	sha1_name.o\
	shallow.o\
	sideband.o\
	sigchain.o\
	split-index.o\
	strbuf.o\
	streaming.o\
	string-list.o\
	submodule.o\
	submodule-config.o\
	symlinks.o\
	tag.o\
	tempfile.o\
	trace.o\
	trailer.o\
	transport.o\
	transport-helper.o\
	tree-diff.o\
	tree.o\
	tree-walk.o\
	unpack-trees.o\
	url.o\
	urlmatch.o\
	usage.o\
	userdiff.o\
	utf8.o\
	varint.o\
	version.o\
	versioncmp.o\
	walker.o\
	wildmatch.o\
	worktree.o\
	wrapper.o\
	write_or_die.o\
	ws.o\
	wt-status.o\
	xdiff-interface.o\
	unix-socket.o\
	http.o\
	http-walker.o\
	zlib.o

BUILTINOBJS = builtin/add.o\
	builtin/am.o\
	builtin/annotate.o\
	builtin/apply.o\
	builtin/archive.o\
	builtin/bisect--helper.o\
	builtin/blame.o\
	builtin/branch.o\
	builtin/bundle.o\
	builtin/cat-file.o\
	builtin/check-attr.o\
	builtin/check-ignore.o\
	builtin/check-mailmap.o\
	builtin/check-ref-format.o\
	builtin/checkout-index.o\
	builtin/checkout.o\
	builtin/clean.o\
	builtin/clone.o\
	builtin/column.o\
	builtin/commit-tree.o\
	builtin/commit.o\
	builtin/config.o\
	builtin/count-objects.o\
	builtin/credential.o\
	builtin/describe.o\
	builtin/diff-files.o\
	builtin/diff-index.o\
	builtin/diff-tree.o\
	builtin/diff.o\
	builtin/fast-export.o\
	builtin/fetch-pack.o\
	builtin/fetch.o\
	builtin/fmt-merge-msg.o\
	builtin/for-each-ref.o\
	builtin/fsck.o\
	builtin/gc.o\
	builtin/get-tar-commit-id.o\
	builtin/grep.o\
	builtin/hash-object.o\
	builtin/help.o\
	builtin/index-pack.o\
	builtin/init-db.o\
	builtin/interpret-trailers.o\
	builtin/log.o\
	builtin/ls-files.o\
	builtin/ls-remote.o\
	builtin/ls-tree.o\
	builtin/mailinfo.o\
	builtin/mailsplit.o\
	builtin/merge.o\
	builtin/merge-base.o\
	builtin/merge-file.o\
	builtin/merge-index.o\
	builtin/merge-ours.o\
	builtin/merge-recursive.o\
	builtin/merge-tree.o\
	builtin/mktag.o\
	builtin/mktree.o\
	builtin/mv.o\
	builtin/name-rev.o\
	builtin/notes.o\
	builtin/pack-objects.o\
	builtin/pack-redundant.o\
	builtin/pack-refs.o\
	builtin/patch-id.o\
	builtin/prune-packed.o\
	builtin/prune.o\
	builtin/pull.o\
	builtin/push.o\
	builtin/read-tree.o\
	builtin/receive-pack.o\
	builtin/reflog.o\
	builtin/remote.o\
	builtin/remote-ext.o\
	builtin/remote-fd.o\
	builtin/repack.o\
	builtin/replace.o\
	builtin/rerere.o\
	builtin/reset.o\
	builtin/rev-list.o\
	builtin/rev-parse.o\
	builtin/revert.o\
	builtin/rm.o\
	builtin/send-pack.o\
	builtin/shortlog.o\
	builtin/show-branch.o\
	builtin/show-ref.o\
	builtin/stripspace.o\
	builtin/submodule--helper.o\
	builtin/symbolic-ref.o\
	builtin/tag.o\
	builtin/unpack-file.o\
	builtin/unpack-objects.o\
	builtin/update-index.o\
	builtin/update-ref.o\
	builtin/update-server-info.o\
	builtin/upload-archive.o\
	builtin/var.o\
	builtin/verify-commit.o\
	builtin/verify-pack.o\
	builtin/verify-tag.o\
	builtin/worktree.o\
	builtin/write-tree.o

PROGOBJS = credential-store.o\
	daemon.o\
	fast-import.o\
	http-backend.o\
	imap-send.o\
	sh-i18n--envsubst.o\
	shell.o\
	show-index.o\
	upload-pack.o\
	http-fetch.o\
	http-push.o\
	remote-curl.o\
	git.o

XDIFF_OBJS = xdiff/xdiffi.o\
	xdiff/xprepare.o\
	xdiff/xutils.o\
	xdiff/xemit.o\
	xdiff/xmerge.o\
	xdiff/xpatience.o\
	xdiff/xhistogram.o

OBJS = $(LIBOBJS) $(BUILTINOBJS) $(XDIFF_OBJS) $(PROGOBJS)

BIN_EXTRA = git-daemon\
	git-http-backend\
	git-imap-send\
	git-sh-i18n--envsubst\
	git-show-index\
	git-http-push

BIN = git-fast-import\
	git-shell\
	git-upload-pack\
	git-http-fetch\
	git-remote-http\
	git

# excluded for now
SCRIPTS_SH = git-bisect.sh\
	git-difftool--helper.sh\
	git-filter-branch.sh\
	git-merge-octopus.sh\
	git-merge-one-file.sh\
	git-merge-resolve.sh\
	git-mergetool.sh\
	git-quiltimport.sh\
	git-rebase.sh\
	git-request-pull.sh\
	git-stash.sh\
	git-submodule.sh\
	git-web--browse.sh

CLEAN_FILES = common-cmds.h

all: options deps $(BIN)

options:
	@echo $(BIN) build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "CPPFLAGS = $(CPPFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	@echo CC $< 
	@$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

deps: $(SCRIPTS_SH) common-cmds.h

common-cmds.h: generate-cmdlist.sh command-list.txt

common-cmds.h: $(wildcard Documentation/git-*.txt)
	@./generate-cmdlist.sh command-list.txt >$@+ && mv $@+ $@

git-daemon: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) daemon.o $(LDFLAGS)

git-fast-import: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) fast-import.o $(LDFLAGS)

git-http-backend: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) http-backend.o $(LDFLAGS)

git-imap-send: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) imap-send.o $(LDFLAGS)

git-sh-i18n--envsubst: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) sh-i18n--envsubst.o $(LDFLAGS)

git-shell: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) shell.o $(LDFLAGS)

git-show-index: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) show-index.o $(LDFLAGS)

git-upload-pack: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) upload-pack.o $(LDFLAGS)

git-http-fetch: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) http-fetch.o $(LDFLAGS)

git-http-push: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) http-push.o $(LDFLAGS)

git-remote-http: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(XDIFF_OBJS) remote-curl.o $(LDFLAGS)

git: $(OBJS)
	@echo LD $@
	@$(CC) -o $@ $(LIBOBJS) $(BUILTINOBJS) $(XDIFF_OBJS) git.o $(LDFLAGS)

clean:
	@echo cleaning
	@rm -f $(BIN) $(OBJS) $(CLEAN_FILES)

install: all
	@echo installing executable file to $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && chmod 755 $(BIN)
	@cd $(DESTDIR)$(PREFIX)/bin && ln -sf git-remote-http git-remote-https
	@cd $(DESTDIR)$(PREFIX)/bin && ln -sf git-remote-http git-remote-ftp
	@cd $(DESTDIR)$(PREFIX)/bin && ln -sf git-remote-http git-remote-ftps
	@cd templates && $(MAKE) prefix=$(DESTDIR)$(PREFIX) install

uninstall:
	@echo removing executable file from $(DESTDIR)$(PREFIX)/bin
	@cd $(DESTDIR)$(PREFIX)/bin && rm -f $(BIN)
	@cd $(DESTDIR)$(PREFIX)/bin && rm -f git-remote-https git-remote-ftp git-remote-ftps
	@rm -rf $(DESTDIR)$(PREFIX)/share/git-core

.PHONY: deps options clean install uninstall
