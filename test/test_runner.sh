#!/bin/bash

# Source helper functions
for FUNCTION in helpers/*; do
    echo "Importing helper functions in $FUNCTION..."
    # shellcheck source=/dev/null
    . "$FUNCTION"
done


# Source script to test
# shellcheck source=/dev/null
. "$UNIT_UNDER_TEST"

# Statistics variables
ERRORS=0
PASSED=0

# Run tests
printf '\n\n%s\n' "Running tests:"
for TEST in tests/*; do
    printf '%s\n.\n.\n.\n.\n' "-> \"${TEST#*/}\":"

    # shellcheck source=/dev/null

    if . "$TEST"; then
        PASSED=$((PASSED + 1))
        printf '.\n.\n.\n.\n.\n\e[32m%s\e[0m\n\n' "Test \"$TEST\" has passed!"
    else
        ERRORS=$((ERRORS + 1))
        printf '.\n.\n.\n.\n.\n\e[31m%s\e[0m\n\n' "Test \"$TEST\" has failed..."
    fi
done

# Summary
if [ "$ERRORS" -gt 0 ]; then 
    printf '\e[31m%s tests was run, %s succeeded and %s failed\e[0m\n' "$(wc -l <(ls ./tests/) | cut -d' ' -f1)" "$PASSED" "$ERRORS"
else 
    printf '\e[32m%s tests was run, %s succeeded and %s failed\e[0m\n' "$(wc -l <(ls ./tests/) | cut -d' ' -f1)" "$PASSED" "$ERRORS"
fi

clean_up
