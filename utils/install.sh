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

GIT_TRACKME_HASH="$(sha256sum "$TRACKME_SCRIPT" | cut -d' ' -f2)"
INSTALLED_TRACKME_HASH="$(sha256sum ${INSTALL_DIR}${TRACKME_SCRIPT} | cut -d' ' -f2)"

if [ "$GIT_TRACKME_HASH" = "$INSTALLED_TRACKME_HASH" ];then
  echo "Successfully installed latest version from Git."
else
  echo "Hashes don't match - latest version not installed."
fi

