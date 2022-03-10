#!/bin/bash

echo "Calling gitPull..."

gitPull

assert_number_of_pull 1
