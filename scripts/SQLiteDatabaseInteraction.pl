# make sure you have the DBI module installed, You can install it via cpan if you haven't already.
#!/usr/bin/perl

use strict;
use warnings;
use DBI;

# Database connection parameters
my $db_file = 'example.db';
my $dsn = "dbi:SQLite:dbname=$db_file";
my $username = '';
my $password = '';
my $dbh = DBI->connect($dsn, $username, $password, {
    PrintError       => 0,
    RaiseError       => 1,
    AutoCommit       => 1,
    FetchHashKeyName => 'NAME_lc',
});

# Create table if not exists
$dbh->do(q{
    CREATE TABLE IF NOT EXISTS records (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL
    )
});

# Main menu
while (1) {
    print <<EOF;
Main Menu:
1. Add Record
2. View Records
3. Delete Record
4. Exit

EOF

    print "Enter your choice: ";
    my $choice = <STDIN>;
    chomp($choice);

    if ($choice == 1) {
        add_record();
    } elsif ($choice == 2) {
        view_records();
    } elsif ($choice == 3) {
        delete_record();
    } elsif ($choice == 4) {
        last;
    } else {
        print "Invalid choice. Please enter a number from 1 to 4.\n";
    }
}

# Function to add a record
sub add_record {
    print "Enter name: ";
    my $name = <STDIN>;
    chomp($name);

    print "Enter email: ";
    my $email = <STDIN>;
    chomp($email);

    my $sth = $dbh->prepare("INSERT INTO records (name, email) VALUES (?, ?)");
    $sth->execute($name, $email);
    print "Record added successfully.\n";
}

# Function to view all records
sub view_records {
    my $sth = $dbh->prepare("SELECT * FROM records");
    $sth->execute();
    print "Records:\n";
    while (my $row = $sth->fetchrow_hashref) {
        print "ID: $row->{id}, Name: $row->{name}, Email: $row->{email}\n";
    }
}

# Function to delete a record
sub delete_record {
    print "Enter ID of the record to delete: ";
    my $id = <STDIN>;
    chomp($id);

    my $sth = $dbh->prepare("DELETE FROM records WHERE id = ?");
    $sth->execute($id);
    if ($sth->rows > 0) {
        print "Record deleted successfully.\n";
    } else {
        print "No record found with ID $id.\n";
    }
}
