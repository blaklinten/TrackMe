#!/bin/bash

assert_no_space()
{
    [ -z "$1" ] && return 1
    
    INPUT="$1"
    PROCESSED="${INPUT// /}"
    if [ "$INPUT" = "$PROCESSED" ]; then
        return 0
    else
        error_log "$INPUT != $PROCESSED - spaces not removed"
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
        error_log "$INPUT != $PROCESSED - underscores not removed"
        return 1
    fi
}

assert_equals()
{
    if [ -z "$1" ];then
      error_log "No first arg, check params!"
      return 1
    fi
    if [ -z "$2" ];then
      error_log "No second arg, check params!"
      return 1
    fi

    
    if [ "$1" = "$2" ]; then
        echo "$1 == $2"
        return 0
    else
        error_log "$1 != $2"
        return 1
    fi
}
