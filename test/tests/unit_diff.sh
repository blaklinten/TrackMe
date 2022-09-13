#!/bin/bash

#Now
START_TIME_IN_SEC="$(date +%s)"
echo "Now is $START_TIME_IN_SEC"
#4h 30min 22s in the future 
END_TIME_IN_SEC="$((START_TIME_IN_SEC + 60*60*4 + 60*30 + 22))"
echo "Future is $END_TIME_IN_SEC"

DIFF=$(diff "$START_TIME_IN_SEC" "$END_TIME_IN_SEC")
echo "Diff is $DIFF"


assert_equals "$DIFF" "4:30:22" || return 1

# Should not be accepted to diff if result is negative
assert_fail "diff $END_TIME_IN_SEC $START_TIME_IN_SEC" || return 1
