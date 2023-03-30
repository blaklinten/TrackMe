#!/bin/bash

if [[ "$(git branch | grep "\*")" =~ "dmenu" ]]; then
  INSTALL_DIR="usr/local/bin/"
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

cp "$TRACKME_SCRIPT" "$INSTALL_DIR_PREFIX/$INSTALL_DIR/trackMe"
