#!/usr/bin/env perl

use strict;
use warnings;
use feature qw<say>;

use List::Util qw<sum>;
use Scalar::Util qw<looks_like_number>;

if ( @ARGV < 2 || grep { !looks_like_number($_) || $_ < 1 } @ARGV ) {
    say 'List of at least 2 positive numbers required.';
    exit 1;
}

my @combinations;
for ( my $i = 0; $i < @ARGV; $i++ ) {
    for ( my $j = $i; $j < @ARGV; $j++ ) {
        push @combinations, [ @ARGV[ $i .. $j ] ]
            if sum( @ARGV[ $i .. $j ] ) <= sum(@ARGV) / 2;
    }
}

say scalar(
    @{  (   sort { sum( @{$b} ) <=> sum( @{$a} ) || @{$a} <=> @{$b} }
                @combinations
        )[0]
    }
);
