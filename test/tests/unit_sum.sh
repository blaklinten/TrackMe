#!/bin/bash

HOURS=0
MINUTES=0
SEC=0

ONE_HOUR="1:0:0"
ONE_HOUR_IN_MIN="0:60:0"
ONE_HOUR_IN_SEC="0:0:3600"
TWO_HOURS_IN_MIN_AND_SEC="0:60:3600"

ONE_MINUTE="0:1:0"
ONE_MINUTE_IN_SEC="0:0:60"

ONE_SEC="0:0:1"

echo "Calculating sums..."
sum $ONE_SEC
SUM1="$HOURS:$MINUTES:$SEC"
echo "SUM1 is $SUM1"
assert_equals "0:0:1" "$SUM1"
sum $ONE_MINUTE_IN_SEC
SUM2="$HOURS:$MINUTES:$SEC"
echo "SUM2 is $SUM2"
assert_equals "0:1:1" "$SUM2"
sum $ONE_MINUTE
SUM3="$HOURS:$MINUTES:$SEC"
echo "SUM3 is $SUM3"
assert_equals "0:2:1" "$SUM3"
sum $ONE_HOUR
SUM4="$HOURS:$MINUTES:$SEC"
echo "SUM4 is $SUM4"
assert_equals "1:2:1" "$SUM4"
sum $ONE_HOUR_IN_MIN
SUM5="$HOURS:$MINUTES:$SEC"
echo "SUM5 is $SUM5"
assert_equals "2:2:1" "$SUM5"
sum $ONE_HOUR_IN_SEC
SUM6="$HOURS:$MINUTES:$SEC"
echo "SUM6 is $SUM6"
assert_equals "3:2:1" "$SUM6"
sum $TWO_HOURS_IN_MIN_AND_SEC
SUM7="$HOURS:$MINUTES:$SEC"
echo "SUM7 is $SUM7"
assert_equals "5:2:1" "$SUM7"


