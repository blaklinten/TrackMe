#!/bin/bash

assert_shown()
{
    SHOWN="$1"
    TIMES_EXPECTED="$2"

    TIMES_ACTUAL="$(grep -c "$SHOWN" "$TRACKME_IO")"
    if [ "$TIMES_ACTUAL" = "$TIMES_EXPECTED" ]; then
        return 0
    else
        return 1
    fi
}
