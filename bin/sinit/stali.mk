ROOT=../..

include $(ROOT)/config.mk

OBJS = sinit.o
BIN = init
DEPS = config.h

include $(ROOT)/mk/bin.mk

config.h:
	@echo creating $@ from config.def.h
	@cp config.def.h $@
