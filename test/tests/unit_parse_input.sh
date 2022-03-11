#!/bin/bash

WITHOUT_UNDERSCORE_AND_SPACE="testinput"

WITH_ONE_UNDERSCORE="test_input"
WITH_STARTING_UNDERSCORE="_input"
WITH_ENDING_UNDERSCORE="test_"
WITH_TWO_UNDERSCORES="test_input_test"
WITH_TWO_CONSECUTIVE_UNDERSCORES="test__input_test"

WITH_ONE_SPACE="test input"
WITH_STARTING_SPACE=" input"
WITH_ENDING_SPACE="test "
WITH_TWO_SPACES="test input test"
WITH_TWO_CONSECUTIVE_SPACES="test  input"

echo "Input \"$WITHOUT_UNDERSCORE_AND_SPACE\" should not contain neither space, nor underscore"
assert_no_space "$WITHOUT_UNDERSCORE_AND_SPACE" && echo "Without space = \"$WITHOUT_UNDERSCORE_AND_SPACE\"" || return 1
assert_no_underscore "$WITHOUT_UNDERSCORE_AND_SPACE" && echo "Without underscore = \"$WITHOUT_UNDERSCORE_AND_SPACE\"" || return 1

echo "Input \"$WITH_ONE_SPACE\""
PARSED="$(parseSpaces "$WITH_ONE_SPACE")" 
assert_no_space "$PARSED" && echo "Without space = \"$PARSED\"" || return 1

PARSED="$(parseUnderscores "$(parseSpaces "$WITH_ONE_SPACE")")"
echo "Input \"$WITH_ONE_SPACE\" should equal \"$PARSED\""
assert_equals "$WITH_ONE_SPACE" "$PARSED" || return 1

echo "Input \"$WITH_TWO_SPACES\""
PARSED="$(parseSpaces "$WITH_TWO_SPACES")" 
assert_no_space "$PARSED" && echo "Without space = \"$PARSED\"" || return 1

PARSED="$(parseUnderscores "$(parseSpaces "$WITH_TWO_SPACES")")"
echo "Input \"$WITH_TWO_SPACES\" should equal \"$PARSED\""
assert_equals "$WITH_TWO_SPACES" "$PARSED" || return 1

echo "Input \"$WITH_STARTING_SPACE\""
PARSED="$(parseSpaces "$WITH_STARTING_SPACE")" 
assert_no_space "$PARSED" && echo "Without space = \"$PARSED\"" || return 1

PARSED="$(parseUnderscores "$(parseSpaces "$WITH_STARTING_SPACE")")"
echo "Input \"$WITH_STARTING_SPACE\" should equal \"$PARSED\""
assert_equals "$WITH_STARTING_SPACE" "$PARSED" || return 1

echo "Input \"$WITH_ENDING_SPACE\""
PARSED="$(parseSpaces "$WITH_ENDING_SPACE")" 
assert_no_space "$PARSED" && echo "Without space = \"$PARSED\"" || return 1

PARSED="$(parseUnderscores "$(parseSpaces "$WITH_ENDING_SPACE")")"
echo "Input \"$WITH_ENDING_SPACE\" should equal \"$PARSED\""
assert_equals "$WITH_ENDING_SPACE" "$PARSED" || return 1

echo "Input \"$WITH_TWO_CONSECUTIVE_SPACES\""
PARSED="$(parseSpaces "$WITH_TWO_CONSECUTIVE_SPACES")" 
assert_no_space "$PARSED" && echo "Without space = \"$PARSED\"" || return 1

PARSED="$(parseUnderscores "$(parseSpaces "$WITH_TWO_CONSECUTIVE_SPACES")")"
echo "Input \"$WITH_TWO_CONSECUTIVE_SPACES\" should equal \"$PARSED\""
assert_equals "$WITH_TWO_CONSECUTIVE_SPACES" "$PARSED" || return 1

echo "Input \"$WITH_ONE_UNDERSCORE\""
PARSED="$(parseUnderscores "$WITH_ONE_UNDERSCORE")" 
assert_no_underscore "$PARSED" && echo "Without underscores = \"$PARSED\"" || return 1

PARSED="$(parseSpaces "$(parseUnderscores "$WITH_ONE_UNDERSCORE")")"
echo "Input \"$WITH_ONE_UNDERSCORE\" should equal \"$PARSED\""
assert_equals "$WITH_ONE_UNDERSCORE" "$PARSED" || return 1

echo "Input \"$WITH_TWO_UNDERSCORES\""
PARSED="$(parseUnderscores "$WITH_TWO_UNDERSCORES")" 
assert_no_underscore "$PARSED" && echo "Without underscores = \"$PARSED\"" || return 1

PARSED="$(parseSpaces "$(parseUnderscores "$WITH_TWO_UNDERSCORES")")"
echo "Input \"$WITH_TWO_UNDERSCORES\" should equal \"$PARSED\""
assert_equals "$WITH_TWO_UNDERSCORES" "$PARSED" || return 1

echo "Input \"$WITH_STARTING_UNDERSCORE\""
PARSED="$(parseUnderscores "$WITH_STARTING_UNDERSCORE")" 
assert_no_underscore "$PARSED" && echo "Without underscores = \"$PARSED\"" || return 1

PARSED="$(parseSpaces "$(parseUnderscores "$WITH_STARTING_UNDERSCORE")")"
echo "Input \"$WITH_STARTING_UNDERSCORE\" should equal \"$PARSED\""
assert_equals "$WITH_STARTING_UNDERSCORE" "$PARSED" || return 1

echo "Input \"$WITH_ENDING_UNDERSCORE\""
PARSED="$(parseUnderscores "$WITH_ENDING_UNDERSCORE")" 
assert_no_underscore "$PARSED" && echo "Without underscores = \"$PARSED\"" || return 1

PARSED="$(parseSpaces "$(parseUnderscores "$WITH_ENDING_UNDERSCORE")")"
echo "Input \"$WITH_ENDING_UNDERSCORE\" should equal \"$PARSED\""
assert_equals "$WITH_ENDING_UNDERSCORE" "$PARSED" || return 1

echo "Input \"$WITH_TWO_CONSECUTIVE_UNDERSCORES\""
PARSED="$(parseUnderscores "$WITH_TWO_CONSECUTIVE_UNDERSCORES")" 
assert_no_underscore "$PARSED" && echo "Without underscores = \"$PARSED\"" || return 1

PARSED="$(parseSpaces "$(parseUnderscores "$WITH_TWO_CONSECUTIVE_UNDERSCORES")")"
echo "Input \"$WITH_TWO_CONSECUTIVE_UNDERSCORES\" should equal \"$PARSED\""
assert_equals "$WITH_TWO_CONSECUTIVE_UNDERSCORES" "$PARSED"|| return 1

return 0
