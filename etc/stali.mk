ROOT=..

include $(ROOT)/config.mk

ETC = fstab.def\
	group.def\
	hosts.conf.def\
	passwd.def\
	profile.def\
	rc.conf.def\
	shells.def

include $(ROOT)/mk/etc.mk

clean:
