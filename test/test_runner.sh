#!/bin/bash

# Source helper functions
for FUNCTION in helpers/*; do
    . $FUNCTION
done

# Statistics variables

ERRORS=0
PASSED=0

# Run tests

for TEST in tests/*; do
    printf '%s\n.\n.\n.\n.\n' "Running test \"${TEST#*/}\":"

    . $TEST

    if [ "$?" = 0 ]; then
        PASSED=$((PASSED + 1))
        printf '.\n.\n.\n.\n.\n%s' "Test \"$TEST\" has passed!"
    else
        ERRORS=$((ERRORS + 1))
        printf '.\n.\n.\n.\n.\n%s' "Test \"$TEST\" has failed..."
    fi
done

# Summary
printf '%s tests was run, %s succeeded and %s failed' "$(wc -l <(ls ./tests/) | cut -d' ' -f1)" "$PASSED" "$ERRORS"
