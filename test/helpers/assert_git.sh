#!/bin/bash

assert_number_of_pull()
{
    [ -z "$1" ] && return 1
    
    EXPECTED="$1"
    PULLS="$(grep -c "pull" "$TRACKME_IO")"

    if [ "$PULLS" = "$EXPECTED" ]; then
        return 0 
    else
        return 1
    fi
}

assert_number_of_push()
{
    [ -z "$1" ] && return 1
    
    EXPECTED="$1"
    PUSHS="$(grep -c "push" "$TRACKME_IO")"
    if [ "$PUSHS" = "$EXPECTED" ]; then
        return 0
    else
        return 1
    fi
}

assert_added()
{
    [ -z "$1" ] && return 1
    
    EXPECTED="$1"
    ADDED="$(grep -c "$EXPECTED" "$TRACKME_IO")"
    if [ "$ADDED" = "1" ]; then
        return 0
    else
        return 1
    fi
}
