#!/bin/bash

# Clean up
clean_up()
{
    rm -rf "$UNIT_UNDER_TEST" \
          "$TRACKME_IO" \
          #/tmp/.trackme
}

reset_mock_git()
{
    rm -f "$TRACKME_IO"
}
