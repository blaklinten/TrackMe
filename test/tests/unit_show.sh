#!/bin/bash

CHOICE="showing"
CHOICES="$CHOICE $CHOICE $CHOICE"
INFO="You should see [$CHOICES]"

echo "Calling show with INFO=\"$INFO\" and CHOICES=\"$CHOICES\""

show_orig "$INFO" "$CHOICES"

show "$INFO" "$CHOICES"
assert_shown "$CHOICE" "2" || return 1
