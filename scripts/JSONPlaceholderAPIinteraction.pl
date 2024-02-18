#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;
use JSON;

# URL of the JSONPlaceholder API
my $url = 'https://jsonplaceholder.typicode.com/posts';

# Fetch data from the API
my $response = get($url);

# Check if the request was successful
unless (defined $response) {
    die "Failed to fetch data from $url";
}

# Decode JSON response
my $data = decode_json($response);

# Display the fetched data
foreach my $post (@$data) {
    print "Post ID: $post->{id}\n";
    print "Title: $post->{title}\n";
    print "Body: $post->{body}\n";
    print "-----------------------------\n";
}
