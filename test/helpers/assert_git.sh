#!/bin/bash

assert_number_of_pull()
{
    if [ -z "$1" ];then
      error_log "Nothing to assert, check params?"
      return 1
    fi
    
    EXPECTED="$1"
    PULLS="$(grep -c "pull" "$TRACKME_IO")"

    if [ "$PULLS" = "$EXPECTED" ]; then
        return 0 
    else
        error_log "Expected $EXPECTED, got $PULLS pulls."
        return 1
    fi
}

assert_number_of_push()
{
    if [ -z "$1" ];then
      error_log "Nothing to assert, check params?"
      return 1
    fi
    
    EXPECTED="$1"
    PUSHS="$(grep -c "push" "$TRACKME_IO")"
    if [ "$PUSHS" = "$EXPECTED" ]; then
        return 0
    else
        error_log "Expected $EXPECTED, got $PUSHS push."
        return 1
    fi
}

assert_added()
{
    if [ -z "$1" ];then
      error_log "Nothing to assert, check params?"
      return 1
    fi
    
    EXPECTED="$1"
    ADDED="$(grep -c "$EXPECTED" "$TRACKME_IO")"
    if [ "$ADDED" = "1" ]; then
        return 0
    else
        error_log "Expected one \"$EXPECTED\", got $ADDED \"$EXPECTED\"."
        return 1
    fi
}
