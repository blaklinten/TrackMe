#!/bin/bash

assert_number_of_pull()
{
    [ -z "$1" ] && return 1
    
    EXPECTED="$1"
    PULLS="$(grep "pull" "$TRACKME_IO" | wc -l | cut -d' ' -f1)"
    [ "$PULLS" = "$EXPECTED" ] && return 0 || return 1
}

assert_number_of_push()
{
    [ -z "$1" ] && return 1
    
    EXPECTED="$1"
    PUSHS="$(grep "push" "$TRACKME_IO" | wc -l | cut -d' ' -f1)"
    [ "$PUSHS" = "$EXPECTED" ] && return 0 || return 1
}

assert_added()
{
    [ -z "$1" ] && return 1
    
    EXPECTED="$1"
    ADDED="$(grep "$EXPECTED" "$TRACKME_IO" | wc -l | cut -d' ' -f1)"
    [ "$ADDED" = "1" ] && return 0 || return 1
}