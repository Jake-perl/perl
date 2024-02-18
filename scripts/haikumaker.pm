#!/usr/bin/perl

use strict;
use warnings;

# Lists of words for each line of the haiku
my @line1 = qw(Shimmering Autumn Moon Radiant);
my @line2 = qw(Whispers gently through trees Rustling leaves dance);
my @line3 = qw(Crickets sing in the night Peaceful serenity);

# Function to randomly select words and construct a haiku
sub generate_haiku {
    my $line1 = $line1[rand @line1];
    my $line2 = $line2[rand @line2];
    my $line3 = $line3[rand @line3];
    return "$line1\n$line2\n$line3\n";
}

# Generate and print a random haiku
print generate_haiku();
