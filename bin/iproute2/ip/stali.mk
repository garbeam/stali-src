ROOT=../../..

include $(ROOT)/config.mk

BIN = ip
OBJS = ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
    rtm_map.o iptunnel.o ip6tunnel.o tunnel.o ipneigh.o ipntable.o iplink.o \
    ipmaddr.o ipmonitor.o ipmroute.o ipprefix.o iptuntap.o iptoken.o \
    ipxfrm.o xfrm_state.o xfrm_policy.o xfrm_monitor.o \
    iplink_vlan.o link_veth.o link_gre.o iplink_can.o \
    iplink_macvlan.o ipl2tp.o link_vti.o link_vti6.o \
    iplink_vxlan.o tcp_metrics.o iplink_ipoib.o ipnetconf.o link_ip6tnl.o \
    link_iptnl.o link_gre6.o iplink_bond.o iplink_bond_slave.o iplink_hsr.o \
    iplink_bridge.o iplink_bridge_slave.o ipfou.o iplink_ipvlan.o \
    iplink_geneve.o iplink_vrf.o iproute_lwtunnel.o
CLEAN_FILES =  
CPPFLAGS += -D_GNU_SOURCE -DHAVE_SETNS -D_LINUX_IN6_H
CFLAGS += -I../include
LDFLAGS += ../lib/libiproute2.a

include $(ROOT)/mk/bin.mk

