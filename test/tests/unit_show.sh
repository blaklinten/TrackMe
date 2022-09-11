#!/bin/bash

INFO="Testing if show-function works"
CHOICES='showing 
showing
showing'

echo "Calling show with INFO=\"$INFO\" and CHOICES=\"$CHOICES\""

show_orig "$INFO" "$CHOICES"

assert_shown "showing" "3" || return 1
