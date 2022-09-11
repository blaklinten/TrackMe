#!/bin/bash

NOW="$(date +%s)"
TEN_SECONDS="10"
AN_HOUR="3600"
TWO_HOURS="$((3600*2))"
THREE_HOURS="$((3600*3))"
THIRTEEN_HOURS="$((3600*13))"

TEN_SECONDS_AGO="$((NOW - TEN_SECONDS))"
ONE_HOUR_AGO="$((NOW - AN_HOUR))"
TWO_HOURS_AGO="$((NOW - TWO_HOURS))"
THREE_HOURS_AGO="$((NOW - THREE_HOURS))"
THIRTEEN_HOURS_AGO="$((NOW - THIRTEEN_HOURS))"

ACTIVITY_ONE="a test"
PROJECT_ONE="testing"
CLIENT_ONE="test"
ACTIVITY_TWO="another test"
PROJECT_TWO="alpha_testing"
CLIENT_TWO="A-test"

### No entry for the last 12h ###
#
createActivity "$THIRTEEN_HOURS_AGO" "$TWO_HOURS_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

sumEntries

assert_shown "No_timers_active_for_at_least_12h:\[0:0:0\]" 1 || return 1

# Reset DB
reset_mock_git

### A single entry ###
#
# A one hour entry
createActivity "$TWO_HOURS_AGO" "$ONE_HOUR_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

# Default is looking back 12h
sumEntries

assert_shown "$PROJECT_ONE:\[1:0:0\]" 1 || return 1

reset_mock_git

### Multiple entries, different client/project/activity ###
#
# A one hour entry
createActivity "$TWO_HOURS_AGO" "$ONE_HOUR_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

# Even though this entry is for another client it should be calculated, as it started within the last 12h, but not included in the same sum
createActivity "$THREE_HOURS_AGO" "$ONE_HOUR_AGO" "$ACTIVITY_TWO" "$PROJECT_TWO" "$CLIENT_TWO"

sumEntries

# 1h from first test
assert_shown "$PROJECT_ONE:\[1:0:0\]" 1 || return 1
# 2h from this test
assert_shown "$PROJECT_TWO:\[2:0:0\]" 1 || return 1

reset_mock_git

### Multiple entries for same activity/project/client ###
#
# A one hour entry
createActivity "$TWO_HOURS_AGO" "$ONE_HOUR_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"
# Another one hour entry for already calculated activity/project/client
createActivity "$THREE_HOURS_AGO" "$TWO_HOURS_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

sumEntries

# Two entries with 1h: 2 x 1h = 2h
assert_shown "$PROJECT_ONE:\[2:0:0\]" 1 || return 1

reset_mock_git

### Entry started more than 12h ago should not be calculated but all others should be ###
#
# This entry started more than 12h ago and should therefore not be included
createActivity "$THIRTEEN_HOURS_AGO" "$TWO_HOURS_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

# These entries should be calculated
createActivity "$TWO_HOURS_AGO" "$ONE_HOUR_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"
createActivity "$THREE_HOURS_AGO" "$TWO_HOURS_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

sumEntries

# Two entries with 1h: 2 x 1h = 2h
assert_shown "$PROJECT_ONE:\[2:0:0\]" 1 || return 1

reset_mock_git

### Adding running entry ###
#
# A one hour entry
createActivity "$TWO_HOURS_AGO" "$ONE_HOUR_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"
# Start a running entry
startTestActivity "$TEN_SECONDS_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

sumEntries

#This is very sketchy since it depends on executing speed. TODO fix better way to test this... 
assert_shown "$PROJECT_ONE:\[1:0:10\]" 1 || assert_shown "$PROJECT_ONE:\[1:0:11\]" 1 || return 1
reset_mock_git

### Only running entry ###
#
# Start a running entry
startTestActivity "$TEN_SECONDS_AGO" "$ACTIVITY_ONE" "$PROJECT_ONE" "$CLIENT_ONE"

sumEntries

#This is very sketchy since it depends on executing speed. TODO fix better way to test this... 
assert_shown "$PROJECT_ONE:\[0:0:10\]" 1 || assert_shown "$PROJECT_ONE:\[0:0:11\]" 1 || return 1
