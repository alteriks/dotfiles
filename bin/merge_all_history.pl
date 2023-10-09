#!/usr/bin/perl
use warnings;
use strict;
# use re 'debugcolor';


my @array;
foreach my $host ( "carbon", "lordjim", "hal", "moar", "nebula" ) {

  my $filename = "/home/alteriks/.local/share/zsh/history_$host";

  open(my $fh, '<', $filename) or die $!;

  while(my $line = <$fh>){
    # if (my ($time, $cmd) = $line =~ /^: (\d{10}):\d+?;([^\n]*)$/) {
    if (my ($time, $cmd) = $line =~ /^: (\d{10}):\d+?;([\s\S]+)$/) {
      push(@array,"$time $host: $cmd");
    }
    # my ($time, $cmd) = $line =~ /^: (\d{10}):\d+?;(.*$)/o;
    # push(@array,"$time $host: $cmd\n");

    # push(@array,$line =~ s/: (\d{10}):\d+?;(.*)/$1 $host: $2/r);
    #
  }

  close($fh);
}
# print "$array[1]";
# my @sorted;
my @sorted = sort { $a cmp $b } @array;
# print "@array\n";
# print "@sorted\n";

foreach my $line (@sorted) {
  print substr($line,11);
}


