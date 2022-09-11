#!/bin/bash

# Clean up
reset_mock_git()
{
    rm -f "$TRACKME_IO"
    rm -rf /tmp/.trackme/*
    mkdir /tmp/.trackme/reports
    touch /tmp/.trackme/events
}

clean_up()
{
    rm -f "$UNIT_UNDER_TEST"
    reset_mock_git
}

