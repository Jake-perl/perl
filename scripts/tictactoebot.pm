#!/usr/bin/perl

use strict;
use warnings;

# Tic-Tac-Toe board representation
my @board = (
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
);

# Function to display the Tic-Tac-Toe board
sub display_board {
    print "+---+---+---+\n";
    for my $row (@board) {
        print "| $row->[0] | $row->[1] | $row->[2] |\n";
        print "+---+---+---+\n";
    }
}

# Function to check if the board is full
sub board_full {
    for my $row (@board) {
        return 0 if grep { $_ eq ' ' } @$row;
    }
    return 1;
}

# Function to check for a win
sub check_win {
    my ($symbol) = @_;

    # Check rows
    for my $row (@board) {
        return 1 if $row->[0] eq $symbol && $row->[1] eq $symbol && $row->[2] eq $symbol;
    }

    # Check columns
    for my $col (0..2) {
        return 1 if $board[0][$col] eq $symbol && $board[1][$col] eq $symbol && $board[2][$col] eq $symbol;
    }

    # Check diagonals
    return 1 if $board[0][0] eq $symbol && $board[1][1] eq $symbol && $board[2][2] eq $symbol;
    return 1 if $board[0][2] eq $symbol && $board[1][1] eq $symbol && $board[2][0] eq $symbol;

    return 0;
}

# Function to make the AI move
sub ai_move {
    my ($symbol) = @_;

    # Simple AI: Make a random move
    my @empty_positions;
    for my $i (0..2) {
        for my $j (0..2) {
            if ($board[$i][$j] eq ' ') {
                push @empty_positions, [$i, $j];
            }
        }
    }

    if (@empty_positions) {
        my $random_index = int(rand(@empty_positions));
        my ($x, $y) = @{$empty_positions[$random_index]};
        $board[$x][$y] = $symbol;
    }
}

# Main game loop
while (1) {
    display_board();
    
    # Human player's move
    print "Enter your move (row column): ";
    my $move = <STDIN>;
    chomp($move);
    my ($row, $col) = split(' ', $move);
    if ($board[$row][$col] eq ' ') {
        $board[$row][$col] = 'X';
        last if check_win('X');
        last if board_full();
        ai_move('O');
        last if check_win('O');
        last if board_full();
    } else {
        print "Invalid move. Try again.\n";
    }
}

# Display final board
display_board();

# Check and display the winner
if (check_win('X')) {
    print "Congratulations! You win!\n";
} elsif (check_win('O')) {
    print "AI wins! Better luck next time!\n";
} else {
    print "It's a draw!\n";
}
