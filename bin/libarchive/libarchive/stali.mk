ROOT=../../..

include $(ROOT)/config.mk

CFLAGS = -I. -I.. -I../libarchive_fe -I$(ROOT)/lib/zlib
CPPFLAGS = -DHAVE_CONFIG_H
LIB = libarchive.a
LIB_INST =
OBJS = ../libarchive_fe/line_reader.o\
	../libarchive_fe/err.o\
	archive_acl.o \
	archive_check_magic.o \
	archive_cmdline.o archive_crypto.o \
	archive_entry.o \
	archive_entry_copy_stat.o \
	archive_entry_link_resolver.o \
	archive_entry_sparse.o \
	archive_entry_stat.o \
	archive_entry_strmode.o \
	archive_entry_xattr.o \
	archive_getdate.o archive_match.o \
	archive_options.o archive_pathmatch.o \
	archive_ppmd7.o archive_rb.o \
	archive_read.o \
	archive_read_append_filter.o \
	archive_read_data_into_fd.o \
	archive_read_disk_entry_from_file.o \
	archive_read_disk_posix.o \
	archive_read_disk_set_standard_lookup.o \
	archive_read_extract.o \
	archive_read_open_fd.o \
	archive_read_open_file.o \
	archive_read_open_filename.o \
	archive_read_open_memory.o \
	archive_read_set_format.o \
	archive_read_set_options.o \
	archive_read_support_filter_all.o \
	archive_read_support_filter_bzip2.o \
	archive_read_support_filter_compress.o \
	archive_read_support_filter_grzip.o \
	archive_read_support_filter_gzip.o \
	archive_read_support_filter_lrzip.o \
	archive_read_support_filter_lzop.o \
	archive_read_support_filter_none.o \
	archive_read_support_filter_program.o \
	archive_read_support_filter_rpm.o \
	archive_read_support_filter_uu.o \
	archive_read_support_filter_xz.o \
	archive_read_support_format_7zip.o \
	archive_read_support_format_all.o \
	archive_read_support_format_ar.o \
	archive_read_support_format_by_code.o \
	archive_read_support_format_cab.o \
	archive_read_support_format_cpio.o \
	archive_read_support_format_empty.o \
	archive_read_support_format_iso9660.o \
	archive_read_support_format_lha.o \
	archive_read_support_format_mtree.o \
	archive_read_support_format_rar.o \
	archive_read_support_format_raw.o \
	archive_read_support_format_tar.o \
	archive_read_support_format_xar.o \
	archive_read_support_format_zip.o \
	archive_string.o \
	archive_string_sprintf.o \
	archive_util.o archive_virtual.o \
	archive_write.o \
	archive_write_disk_acl.o \
	archive_write_disk_posix.o \
	archive_write_disk_set_standard_lookup.o \
	archive_write_open_fd.o \
	archive_write_open_file.o \
	archive_write_open_filename.o \
	archive_write_open_memory.o \
	archive_write_add_filter.o \
	archive_write_add_filter_b64encode.o \
	archive_write_add_filter_by_name.o \
	archive_write_add_filter_bzip2.o \
	archive_write_add_filter_compress.o \
	archive_write_add_filter_grzip.o \
	archive_write_add_filter_gzip.o \
	archive_write_add_filter_lrzip.o \
	archive_write_add_filter_lzop.o \
	archive_write_add_filter_none.o \
	archive_write_add_filter_program.o \
	archive_write_add_filter_uuencode.o \
	archive_write_add_filter_xz.o \
	archive_write_set_format.o \
	archive_write_set_format_7zip.o \
	archive_write_set_format_ar.o \
	archive_write_set_format_by_name.o \
	archive_write_set_format_cpio.o \
	archive_write_set_format_cpio_newc.o \
	archive_write_set_format_iso9660.o \
	archive_write_set_format_mtree.o \
	archive_write_set_format_pax.o \
	archive_write_set_format_shar.o \
	archive_write_set_format_ustar.o \
	archive_write_set_format_v7tar.o \
	archive_write_set_format_gnutar.o \
	archive_write_set_format_xar.o \
	archive_write_set_format_zip.o \
	archive_write_set_options.o \
	filter_fork_posix.o
CLEAN_FILES = 

include $(ROOT)/mk/lib.mk

