#!/bin/bash

# Clean up
clean_up()
{
    rm "$UNIT_UNDER_TEST" \
        "$TRACKME_IO"
}

reset_mock_git()
{
    rm "$TRACKME_IO"
}
