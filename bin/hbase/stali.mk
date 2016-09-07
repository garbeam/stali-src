ROOT=../..

# NOTE: was nothing using libuxre?
SUBDIRS =\
	libcommon\
	yacc\
	_install\
	stty\
	awk\
	fmt\
	hd\
	bc\
	pgrep\
	diff\
	lex

include $(ROOT)/mk/dir.mk

awk bc lex: yacc

dc diff fmt hd pgrep stty: libcommon

