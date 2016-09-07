ROOT=..

SUBDIRS = hbase\
	sbase\
	ubase\
	sinit\
	smdev\
	utmp\
	mksh\
	libarchive\
	curl\
	ssh\
	rc\
	sdhcp\
	iproute2\
	vis\
	kbd\
	gzip\
	abduco\
	dvtm\
	git\
	e2fsprogs\
	parted

include $(ROOT)/mk/dir.mk

parted: e2fsprogs
