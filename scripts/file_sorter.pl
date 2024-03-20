#!/usr/bin/perl

use strict;
use warnings;
use File::Copy;

# Directory where files are located
my $directory = "path/to/your/directory";

# Iterate through each file in the directory
opendir(my $dh, $directory) || die "Can't open directory $directory: $!";
while (my $file = readdir($dh)) {
    next if $file =~ /^\./; # Skip hidden files
    next unless -f "$directory/$file"; # Skip if not a regular file
    
    # Get the file extension
    my ($extension) = $file =~ /\.([^.]+)$/;
    $extension = lc($extension); # Convert to lowercase
    
    # Create directory based on file extension if it doesn't exist
    my $new_directory = "$directory/$extension";
    mkdir $new_directory unless -d $new_directory;
    
    # Move the file to the appropriate directory
    move("$directory/$file", "$new_directory/$file") or die "Move failed: $!";
}
closedir $dh;
