#!/bin/bash

WD="./trackmedata"
cd "$WD/" || exit

find . -type f -not -path './.git*' -not -name "*.csv" -exec sed -i \
  -e 's/\ mån\ /\ Mon\ /' \
  -e 's/\ tis\ /\ Tue\ /' \
  -e 's/\ ons\ /\ Wed\ /' \
  -e 's/\ tor\ /\ Thu\ /' \
  -e 's/\ fre\ /\ Fri\ /' \
  -e 's/\ lör\ /\ Sat\ /' \
  -e 's/\ sön\ /\ Sun\ /' \
  -e 's/CET//' \
  -e 's/CEST//' \
  -e 's/\([[:alpha:]\{3\}[[:space:]]*[[:digit:]]\{1,2\}[[:space:]]*[[:alpha:]]\{3\}[[:space:]]*\)\([[:digit:]]\{1,2\}:[[:digit:]]\{1,2\}:[[:digit:]]\{1,2\}[[:space:]]*\)\([[:digit:]]\{4\}\)/\1\3 \2/' \
  -e 's/0\([[:digit:]]:\)/\1/' \
  -e 's/:0\([[:digit:]]\)/:\1/' \
  {} \;
