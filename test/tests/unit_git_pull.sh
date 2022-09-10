#!/bin/bash

echo "Calling gitPull..."

gitPull

assert_number_of_pull 1 || return 1
