#!/usr/bin/perl -w
#DokuWiki Specific perl script to convert html files to DokuWiki Markup.
#Requires HTML::WikiConverter Perl module

use HTML::WikiConverter;

print "HTML to DokuWiki markup converter\n";
my $argcnt = $#ARGV + 1;
if ($argcnt == 2) {
	printf "Converting...";
	my $infile = "$ARGV[0]";
	my $outfile= "$ARGV[1]";
	use Shell qw(html2wiki);
	$ENV{'WCDIALECT'} = 'DokuWiki';
	html2wiki ("$infile > $outfile");
	open FILE, ">$outfile" or die $!;		
	while (<FILE>) {
		print $_;
	}
	close FILE;
	printf "done.\nYour DokuWiki article is now available in $outfile.\n";
}
	else {
		printf "Usage: html2doku input.html output.txt\n";
		
}
