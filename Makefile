$(shell perl init-one2one.pl)

CFLAGS+= -DUIP_CONF_IPV6=1

all: one2one-node-1 one2one-node-2 one2one-node-3 one2one-node-4 one2one-node-5 one2one-node-6 one2one-node-7 one2one-node-8 one2one-node-9 one2one-node-10 one2one-node-11 one2one-node-12 one2one-node-13 one2one-node-14 one2one-node-15 one2one-node-16 one2one-node-17 one2one-node-18 one2one-node-19 one2one-node-20 one2one-node-21 one2one-node-22 one2one-node-23 one2one-node-24 one2one-node-25
PROJECT_SOURCEFILES += aes256.c crypto-hw.c
CONTIKI=../..

CONTIKI_WITH_IPV6 = 1
include $(CONTIKI)/Makefile.include
