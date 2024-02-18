#!/usr/bin/perl

use strict;
use warnings;

# generates a random password
sub generate_password {
    my $length = shift;
    my @chars = ('a'..'z', 'A'..'Z', 0..9, qw(! @ # $ % ^ & * ( ) _ +));
    my $password = '';
    for (1..$length) {
        $password .= $chars[rand @chars];
    }
    return $password;
}

# Main program
print "Enter the length of the password you want to generate: ";
my $length = <STDIN>;
chomp($length);

# Validate input
if ($length =~ /^\d+$/ && $length > 0) {
    my $password = generate_password($length);
    print "Generated password: $password\n";
} else {
    print "Invalid input. Please enter a positive integer.\n";
}
