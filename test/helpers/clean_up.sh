#!/bin/bash

# Clean up
reset_mock_git()
{
    rm -f "$TRACKME_IO"
    rm -rf /tmp/.trackme/*
}

clean_up()
{
    rm -f "$UNIT_UNDER_TEST"
    reset_mock_git
}

