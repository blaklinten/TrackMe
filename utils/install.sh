#!/bin/bash

BRANCH="$(git branch | grep "\*")" 
if [[ "$BRANCH" =~ "dmenu" ]]; then
  INSTALL_DIR="/usr/local/bin/"
else
  INSTALL_DIR="../../../usr/bin/"
fi

if [ -f ./trackMe ];then
  TRACKME_SCRIPT="./trackMe"
  INSTALL_DIR_PREFIX=""
elif [ -f ../trackMe ];then
  TRACKME_SCRIPT="../trackMe"
  INSTALL_DIR_PREFIX=".."
fi

sudo cp "$TRACKME_SCRIPT" "${INSTALL_DIR_PREFIX}${INSTALL_DIR}/trackMe"
