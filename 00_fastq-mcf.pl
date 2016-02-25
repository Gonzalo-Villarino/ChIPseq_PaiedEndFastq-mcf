use strict;
use warnings;

open(FILE,"/home3/gonzalo/Angelina/00_raw.reads/file.names.txt") or die;
while(<FILE>){
	chomp;
	my $name = $_;
	$name =~ s/_R1_001\.fastq\.gz//;
	$name =~ s/_R2_001\.fastq\.gz//;	
	open(OUT,">$name.sh") or die;
	print OUT "#!/bin/bash\n";
	print OUT "/home3/gonzalo/ea-utils.1.1.2-537/fastq-mcf -q 20 -l 50 -o /home3/gonzalo/Angelina/00_cleaned.reads/$name.R1.fq -o /home3/gonzalo/Angelina/00_cleaned.reads/$name.R2.fq /home3/gonzalo/Angelina/IlluminaAdaptorSeq.2016.fasta /home3/gonzalo/Angelina/00_raw.reads/$name\_R1_001.fastq.gz /home3/gonzalo/Angelina/00_raw.reads/$name\_R2_001.fastq.gz";
	print "$name\n";
	close OUT;
}
close FILE;
