#!/bin/bash

# Create a few predictable entries to use in tests

export DB="/tmp/.trackme"
export EVENT_FILE="$DB/events"

TEST_CALCULATE_DIFF()
{
  ((DIFF = $2 - $1))
  ((SECONDS = DIFF % 60))
  ((MINUTES = (DIFF % 3600) / 60))
  ((HOURS = DIFF / 3600))

	echo "$HOURS:$MINUTES:$SECONDS"
}

createActivity()
{
  START="$1"
  STOP="$2"
  ACTIVITY="$3"
  PROJECT="$4"
  CLIENT="$5"
  DIFF="$(TEST_CALCULATE_DIFF "$START" "$STOP")"
  printf "%s%s\n%s%s\n%s%s\n%s\n%s\n%s\n" \
        "Duration: " "$DIFF" \
        "Ended at " "$(date "$DATE_FORMAT" --date=@"$STOP")" \
        "Started at " "$(date "$DATE_FORMAT" --date=@"$START")" \
        "Activity: $ACTIVITY" \
        "Project: $PROJECT" \
        "Client: $CLIENT" \
         >> "$EVENT_FILE"
}

startTestActivity()
{
  START="$1"
  ACTIVITY="$2"
  PROJECT="$3"
  CLIENT="$4"

  printf '%s\n%s\n%s\n%s\n' \
    "$CLIENT" \
    "$ACTIVITY" \
    "$PROJECT" \
    "$START" \
    > "$ACTIVE"
}
