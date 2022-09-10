#!/bin/bash

TEST_ACTIVITY="adding"

echo "Calling gitAdd with TEST_ACTIVITY=\"$TEST_ACTIVITY\"..."

gitAdd "$TEST_ACTIVITY"

assert_added "$TEST_ACTIVITY" || return 1
