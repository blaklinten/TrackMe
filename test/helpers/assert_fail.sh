#!/bin/bash

error_log()
{
  printf '\e[31m%s\e[0m\n\n' "$@"
}

assert_fail()
{
  echo -n "Expected to fail: "
  if eval "$1"; then
    error_log "[$1] expected to fail, did succeed"
    return 1
  else
    return 0
  fi
}
