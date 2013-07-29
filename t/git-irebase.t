#!/usr/bin/env perl

# usage: perl git-irebase.t

use strict;
use warnings;

use File::Basename;
use Test::Simple tests => 7;
#use Test::Simple qw(no_plan);

require(dirname(__FILE__) . '/../git-irebase');

my @arg = ();
ok(main(@arg) eq 'git rebase -i HEAD~2 ');

@arg = ('5');
ok(main(@arg) eq 'git rebase -i HEAD~5 ');

@arg = ('^^^');
ok(main(@arg) eq 'git rebase -i HEAD^^^ ');

@arg = ('~10');
ok(main(@arg) eq 'git rebase -i HEAD~10 ');

@arg = ('HEAD~3');
ok(main(@arg) eq 'git rebase -i HEAD~3 ');

@arg = ('2', 'branch');
ok(main(@arg) eq 'git rebase -i HEAD~2 branch');

@arg = ('2~^');
ok(main(@arg) eq 'git rebase -i 2~^ ');

