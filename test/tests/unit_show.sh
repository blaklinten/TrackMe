#!/bin/bash

INFO="Testing if show-function works"
CHOICE="showing"
CHOICES="$CHOICE $CHOICE $CHOICE"

echo "Calling show with INFO=\""$INFO"\" and CHOICES=\""$CHOICES"\""

show_orig "$INFO" "$CHOICES"

assert_shown "$CHOICE" "3"
