#!/bin/bash

## chkPrime.sh version 0.2 - Prime number check. One-line check using perl and regex. @drgfragkos 2019   ##
##                           Each generated PAN is also checked against valid IIN.                       ##
##                                                                                                       ##
## USAGE: chkPrime.sh [INTEGER]                                                                          ##
##                                                                                                       ##
## Use from Bash to check a given range:                                                                 ##
##  for i in {1..100}; do ( ./chkPrime.sh $i ); done                                                     ##
##                                                                                                       ##
## inspired by (also fixed a problem with Prime checks when [INT] >= 65535):                             ##
##        - http://montreal.pm.org/tech/neil_kandalgaonkar.shtml                                         ##
##        - http://neilk.net/blog/2000/06/01/abigails-regex-to-test-for-prime-numbers/                   ##
##                                                                                                       ##

re='^[0-9]+$'                                                                              #regex equivilant to: isnumeric

if [ $# -eq 1 ] && [[ $1 =~ $re ]]; then                                                   
  if [ "$(perl -Xwle 'print "1" if (1 x shift) !~ /^1?$|^(11+?)\1+$/' $1)" == 1 ] ; then   #use regex to check if it is a prime number
    echo $1                                                                                #echo the given number ONLY if it is a valid Prime
  fi
fi

