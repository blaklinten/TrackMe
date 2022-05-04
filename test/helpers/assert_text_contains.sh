#!/bin/bash

assert_no_space()
{
    [ -z "$1" ] && return 1
    
    INPUT="$1"
    PROCESSED="${INPUT// /}"
    if [ "$INPUT" = "$PROCESSED" ]; then
        return 0
    else
        return 1
    fi
}

assert_no_underscore()
{
    [ -z "$1" ] && return 1
    
    INPUT="$1"
    PROCESSED="${INPUT//_/}"
    if [ "$INPUT" = "$PROCESSED" ]; then
        return 0
    else
        return 1
    fi
}

assert_equals()
{
    [ -z "$1" ] && return 1
    [ -z "$2" ] && return 1
    
    if [ "$1" = "$2" ]; then
        return 0
    else
        return 1
    fi
}
