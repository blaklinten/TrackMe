#!/bin/bash

# Source main script to test
UNIT_UNDER_TEST="/tmp/trackMe"
TRACKME_IO="/tmp/trackMeIO"

sed -e 's/^main$//' \
    -e 's/show()/show_orig()/' \
    -e 's/show "Git: Pulling..." &/show "Git: Pulling..."/' \
    -e 's/git pull.*/echo pull >> \$TRACKME_IO/' \
    -e 's/git push.*/echo push >> \$TRACKME_IO/' \
    -e 's/git add.*/echo "$NEW_ACTIVITY" >> \$TRACKME_IO/' \
    -e 's/| dmenu -i -p "$INFO"/>> \$TRACKME_IO; echo "$INFO" >> \$TRACKME_IO/' \
    "../trackMe" > "$UNIT_UNDER_TEST"

# Adding testing show-function
echo 'show()
    {
	    INFO="$1"
	    CHOICES="$2"
	    printf "Choices: %s\nInfo: %s\n" "$CHOICES" "$INFO"
    }' >> "$UNIT_UNDER_TEST"
