#!/usr/bin/env perl
# From https://www.jwz.org/blog/2020/08/the-date-is-now-tuesday-march-178th-2020/

use Date::Parse;
use POSIX;
my @t = localtime;
print strftime ("March ", @t) . int (1 + 0.5 + ((str2time (strftime ("%Y-%m-%d 3:00", @t)) - str2time ("2020-03-01 3:00")) /(60*60*24)));

