#!/bin/bash

# Source main script to test
UNIT_UNDER_TEST="/tmp/trackMe"
export TRACKME_IO="/tmp/trackMeIO"

# shellcheck disable=SC2016
sed -e 's/^main$//' \
    -e 's/show()/show_orig()/' \
    -e 's/show "Git: Pulling..." &/show "Git: Pulling..."/' \
    -e 's/git pull.*/echo pull >> \$TRACKME_IO/' \
    -e 's/git push.*/echo push >> \$TRACKME_IO/' \
    -e 's/git add.*/echo "$NEW_ACTIVITY" >> \$TRACKME_IO/' \
    -e 's/| dmenu -i -p "$INFO"/>> \$TRACKME_IO; echo "$INFO" >> \$TRACKME_IO/' \
    -e 's|export CLIENTS="$HOME/.trackme"|export CLIENTS="/tmp/.trackme"|' \
    -e 's/show "Total time = $HOURS:$MINUTES:$SEC"/show "Total time = $HOURS:$MINUTES:$SEC" "C:$CLIENT P:$PROJECT A:$ACTIVITY"/' \
    "../trackMe" > "$UNIT_UNDER_TEST"

# Adding testing show-function
# shellcheck disable=SC2016
# shellcheck disable=SC2028
echo 'show()
    {
	    INFO="$1"
	    CHOICES="$2"
	    printf "Choices: %s\nInfo: %s\n" "$CHOICES" "$INFO" >> $TRACKME_IO
    }' >> "$UNIT_UNDER_TEST"
