#!/bin/bash

assert_shown()
{
    SHOWN="$1"
    TIMES_EXPECTED="$2"

    TIMES_ACTUAL="$(grep "$SHOWN" "$TRACKME_IO" | wc -l | cut -d' ' -f1)"
    [ "$TIMES_ACTUAL" = "$TIMES_EXPECTED" ] && return 0 || return 1
}
