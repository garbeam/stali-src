ROOT=..

SUBDIRS =\
	9base\
	abduco\
	curl\
	dvtm\
	e2fsprogs\
	git\
	gzip\
	hbase\
	iproute2\
	kbd\
	libarchive\
	mksh\
	parted\
	rc\
	sbase\
	sdhcp\
	sinit\
	smdev\
	ssh\
	ubase\
	utmp\
	vis\

include $(ROOT)/mk/dir.mk

parted: e2fsprogs
9base: hbase
