#!/bin/bash

echo "Calling gitPush..."

gitPush

assert_number_of_push 1
