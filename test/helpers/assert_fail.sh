#!/bin/bash

assert_fail()
{
  if eval "$1"; then
    return 1
  else
    return 0
  fi
}
