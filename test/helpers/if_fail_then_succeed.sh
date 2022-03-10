#!/bin/bash

if_fail_then_succeed()
{
    EXIT_CODE="$1"

    [ "$EXIT_CODE" = "0" ] && return 1 || return 0
}
