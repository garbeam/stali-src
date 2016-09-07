ROOT=../../..

include $(ROOT)/config.mk

LIB = libuxre.a
OBJS = onefile.o regfree.o regerror.o
CFLAGS += -I.

include $(ROOT)/mk/lib.mk

_collelem.o: colldata.h re.h regex.h wcharm.h
_collmult.o: colldata.h re.h regex.h wcharm.h
bracket.o: colldata.h re.h regex.h wcharm.h
regcomp.o: colldata.h re.h regex.h wcharm.h
regdfa.o: colldata.h regdfa.h re.h regex.h wcharm.h 
regerror.o: colldata.h re.h regex.h wcharm.h
regexec.o: colldata.h re.h regex.h wcharm.h
regfree.o: colldata.h re.h regex.h wcharm.h
regnfa.o: colldata.h re.h regex.h wcharm.h
regparse.o: colldata.h re.h regex.h wcharm.h
stubs.o: colldata.h wcharm.h
onefile.o: _collelem.c _collmult.c bracket.c regcomp.c regdfa.c regexec.c
onefile.o: regfree.c regnfa.c regparse.c stubs.c 
