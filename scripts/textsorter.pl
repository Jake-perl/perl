#!/usr/bin/perl

use strict;
use warnings;

# enter the file name
print "Enter the name of the text file: ";
my $filename = <STDIN>;
chomp($filename);

# Open the file or exit if it doesn't exist
unless (open(FILE, "<", $filename)) {
    die "Cannot open file '$filename' for reading: $!";
}

# Reads the file
my %word_count;
while (my $line = <FILE>) {
    chomp($line);
    my @words = split(/\s+/, $line);
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

# Close the file
close(FILE);

# Print the word frequency in descending order
print "Word Frequency:\n";
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    print "$word: $word_count{$word}\n";
}
