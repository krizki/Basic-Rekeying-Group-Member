$(shell perl init-one2one.pl)

all: one2one-node-1-1-1 one2one-node-2-2-1 one2one-node-3-2-2 one2one-node-4-3-1 one2one-node-5-1-2 one2one-node-6-3-2 one2one-node-7-3-3 one2one-node-8-4-1 one2one-node-9-5-1 one2one-node-10-4-2 one2one-node-11-4-3 one2one-node-12-5-2 one2one-node-13-2-3 one2one-node-14-3-4 one2one-node-15-3-5
PROJECT_SOURCEFILES += aes256.c hmac_sha2.c sha2.c
CONTIKI=../..

CONTIKI_WITH_IPV6 = 1
include $(CONTIKI)/Makefile.include
