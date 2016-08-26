ROOT=../../..

include $(ROOT)/config.mk

CFLAGS = -I../include -I. -I../include/compat
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -D_GNU_SOURCE
OBJS = ssl_err2.o\
	ssl_sess.o\
	s3_pkt.o\
	s23_lib.o\
	bs_cbs.o\
	d1_clnt.o\
	d1_srvr.o\
	t1_enc.o\
	bs_cbb.o\
	d1_lib.o\
	t1_reneg.o\
	d1_pkt.o\
	bio_ssl.o\
	pqueue.o\
	t1_lib.o\
	d1_srtp.o\
	ssl_cert.o\
	d1_meth.o\
	s3_cbc.o\
	d1_both.o\
	ssl_lib.o\
	t1_meth.o\
	ssl_txt.o\
	s3_lib.o\
	bs_ber.o\
	ssl_err.o\
	s23_srvr.o\
	ssl_ciph.o\
	s3_both.o\
	ssl_asn1.o\
	ssl_rsa.o\
	s23_clnt.o\
	s3_srvr.o\
	t1_srvr.o\
	d1_enc.o\
	t1_clnt.o\
	s3_clnt.o\
	s23_pkt.o\
	ssl_algs.o\
	ssl_stat.o
LIB = libssl.a

include $(ROOT)/mk/lib.mk
