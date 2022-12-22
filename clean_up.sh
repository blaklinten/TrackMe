#!/bin/bash

WD="./trackmedata"
cd "$WD/" || exit

find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec sed -i -e s/\ sön\ /\ Sun\ / {} \;
find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec sed -i -e s/\ mån\ /\ Mon\ / {} \;
find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec sed -i -e s/\ tis\ /\ Tue\ / {} \;
find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec sed -i -e s/\ ons\ /\ Wed\ / {} \;
find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec sed -i -e s/\ tor\ /\ Thu\ / {} \;
find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec sed -i -e s/\ fre\ /\ Fri\ / {} \;
find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec sed -i -e s/\ lör\ /\ Sat\ / {} \;

find . -type f -not -path './.git*' -not -name "clean_up.sh" -not -name "*.csv" -exec \
  sed -i -e 's/CET//' -e 's/CEST//' -e 's/\([[:alpha:]\{3\}[[:space:]]*[[:digit:]]\{1,2\}[[:space:]]*[[:alpha:]]\{3\}[[:space:]]*\)\([[:digit:]]\{1,2\}:[[:digit:]]\{1,2\}:[[:digit:]]\{1,2\}[[:space:]]*\)\([[:digit:]]\{4\}\)/\1\3 \2/' {} \;
