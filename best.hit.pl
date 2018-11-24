#!/usr/bin/perl -w
use strict;
#explanation:this program is edited to 
#edit by panshk;   Sun Oct 30 17:08:38 CST 2016
#Version 1.0    panshk@genomics.org.cn 

die  "Version 1.0\t2016-10-30;\nUsage: $0 <bird.list>\n" unless (@ARGV ==1);

#############Befor  Start  , open the files ####################

open (IA,"$ARGV[0]") || die "input file can't open $!";

#open (OA,">$ARGV[1]") || die "output file can't open $!" ;

################ Do what you want to do #######################
my $dir=`pwd`;chomp $dir;
while(<IA>) 
{ 
	chomp ; 
	chdir 	$_;
	my @best1=`ls *fas.m8*`;
	my @best2=`ls *-*m8`;
	open OA,">$_.besthit.xls" or die;
	my %hash1;
	for(my $i=0;$i<@best1;$i++)
	{
		chomp $best1[$i];
		my %tmp;
		open IB,$best1[$i] or die;
		while(<IB>)
		{
			chomp;
			my @inf=split;
			if(!exists $hash1{$inf[0]})
			{
				$hash1{$inf[0]}=$inf[1];
			}
		}
		close IB;
	}
	
	my %hash2;
	for(my $i=0; $i<@best2; $i++)
	{
		chomp $best2[$i];
		open IB,$best2[$i] or die;
		while(<IB>)
		{
			chomp;
			my @inf=split;
			if(!exists $hash2{$inf[0]})
			{
				$hash2{$inf[0]}=$inf[1];
				if($hash1{$inf[1]} eq $inf[0])
				{
					print OA $inf[0],"\t$inf[1]\n";
				}
			}
		}
		close IB;
	}
	close OA;
	chdir $dir;
}


close IA;
#close OA ;

######################swimming in the sky and flying in the sea ###########################
