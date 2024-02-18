#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

# Input and output file paths
my $input_file = 'input.csv';
my $output_file = 'output.csv';

# Create CSV parser and writer objects
my $csv = Text::CSV->new({ binary => 1, auto_diag => 1, eol => "\n" });

# Open input and output files
open(my $fh_in, '<', $input_file) or die "Can't open $input_file: $!";
open(my $fh_out, '>', $output_file) or die "Can't open $output_file: $!";

# Process each row of the input CSV file and write to output CSV file
while (my $row = $csv->getline($fh_in)) {
    # Perform some processing on the data (For example, let's assume we're just converting the data to uppercase)
    my @processed_row = map { uc($_) } @$row;

    # Write the processed row to the output CSV file
    $csv->print($fh_out, \@processed_row);
}

# Close input and output files
close($fh_in);
close($fh_out);

print "Processing complete. Output written to $output_file\n";
