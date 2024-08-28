#!/usr/bin/env perl
use warnings;
use strict;
# use re 'debugcolor';


my @array;
foreach my $host ( "carbon", "lordjim", "hal", "moar", "nebula" ) {

  my $filename = "/home/alteriks/.local/share/zsh/history_$host";

  open(my $fh, '<', $filename) or die $!;

  while(my $line = <$fh>){
    if (my ($time, $cmd) = $line =~ /^: (\d{10}):\d+?;([\s\S]+)$/) {
      push(@array,"$time $host: $cmd");
    }
  }

  close($fh);
}
my @sorted = sort { $a cmp $b } @array;

foreach my $line (@sorted) {
  print substr($line,11);
}


