#!/bin/bash

assert_no_space()
{
    [ -z "$1" ] && return 1
    
    INPUT="$1"
    PROCESSED="$(sed -e 's/ //' <<<$INPUT)"
    [ "$INPUT" = "$PROCESSED" ] && return 0 || return 1
}

assert_no_underscore()
{
    [ -z "$1" ] && return 1
    
    INPUT="$1"
    PROCESSED="$(sed -e 's/_//' <<<$INPUT)"
    [ "$INPUT" = "$PROCESSED" ] && return 0 || return 1
}

assert_equals()
{
    [ -z "$1" ] && return 1
    [ -z "$2" ] && return 1
    
    [ "$1" = "$2" ] && return 0 || return 1
}
