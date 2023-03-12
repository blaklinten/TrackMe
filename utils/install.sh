#!/bin/bash

if [ -f ./trackMe ];then
  TRACKME_SCRIPT="./trackMe"
elif [ -f ../trackMe ];then
  TRACKME_SCRIPT="../trackMe"
fi

cp "$TRACKME_SCRIPT" /usr/local/bin/trackMe
