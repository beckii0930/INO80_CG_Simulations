#!/bin/bash
sort -n | awk '
  BEGIN {
    c = 0;
    sum = 0;
  }
  $1 ~ /^(\-)?[0-9]*(\.[0-9]*)?$/ {
    a[c++] = $1;
    # c=c+1
    sum += $1;
  }
  END {
    ave = sum / c;
    if( (c % 2) == 1 ) {
      median = a[ int(c/2) ];
    } else {
      median = ( a[c/2] + a[c/2-1] ) / 2;
    }
    printf "%-10s %-10s %-10s %-10s %-10s %-10s\n", "sum", "c", "ave", "median", "first", "last";
    printf "%-10s %-10s %-10s %-10s %-10s %-10s\n", sum, c, ave, median, a[0], a[c-1];
  }
'
