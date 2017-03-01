#!/usr/bin/perl
use File::Copy;

my @delfiles 	= glob('/home/user/contiki-2.7/examples/basic-rekeying/one2one-node-*.c');
for my $delfile (@delfiles) {
  system("rm", $delfile, "-f");
}

my @conffiles 	= glob('/home/user/contiki-2.7/examples/basic-rekeying/conf/*.nocfg');
for my $conffile (@conffiles) {
  system("rm", $conffile, "-f");
}

my @files 	= glob('/home/user/Basic*/*.nocfg');
$k 		= 1;

# Config file initial setting
$conffilename 	= '/home/user/contiki-2.7/examples/basic-rekeying/conf/one2one-conf';
$confext 	= '.nocfg';

# C code for each node initial setting
$nodefilename 	= '/home/user/contiki-2.7/examples/basic-rekeying/one2one-node-';
@nodedata 	= ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25");
$nodeext 	= '.c';

for my $file (@files) {
  if($k < 26) {
    $i = 0;
    $j = 0;
    $conffullname 	= $conffilename.$k.$confext;
    $nodefullname 	= $nodefilename.$nodedata[$k-1].$nodeext;
    copy($file, $conffullname) or die "Copy failed: $!";

    open CONF, $conffullname or die "one2one-conf$k.ncfg: Open failed: $!";
    open TEMP, "temp_one2one_node.c" or die "temp_one2one_node.c: Open failed: $!";
    open MOTE, ">$nodefullname";

    while (<CONF>) {
      (/\(new\) groupKey \(hex\): (.*)/)	&& do {$groupKey = $1};
      (/nodeKey: (.*)/) 			&& do {$nodeKey = $1};
      (/nodeID: (.*)/) 				&& do {$nodeID = $1};
    }

    $groupKey 	= '0x'.join(', 0x', unpack("(A2)*", $groupKey));
    $nodeKey 	= '0x'.join(', 0x', unpack("(A2)*", $nodeKey));

    while (<TEMP>) {
      (/static uint8_t groupKey\[KEYSIZE\] = \{(.*)\}/) && do {s/$1/$groupKey/};
      (/static uint8_t nodeKey\[KEYSIZE\] = \{(.*)\}/) && do {s/$1/$nodeKey/};
      (/static uint32_t nodeID = (.*);/) && do {s/$1/$nodeID/};
      (/static uint32_t subgID = (.*);/) && do {s/$1/$subgID/};

      print MOTE
    }
  
    close CONF;
    close TEMP;
    close MOTE;
    $k++;
  }
}

