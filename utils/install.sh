#!/bin/bash

if [ -f ./trackMe ];then
  TRACKME_SCRIPT="./trackMe"
elif [ -f ../trackMe ];then
  TRACKME_SCRIPT="../trackMe"
else
  echo "Could not find executable in ./ or ../ - exiting"
  exit 1
fi

INSTALL_DIR="/usr/local/bin/"
sudo cp -v "$TRACKME_SCRIPT" "${INSTALL_DIR}trackMe"

if ! GIT_TRACKME_HASH="$(sha256sum "$TRACKME_SCRIPT" | cut -d' ' -f1)"; then
  printf 'Checksum creation for %s failed\n' "$TRACKME_SCRIPT"
fi

if ! INSTALLED_TRACKME_HASH="$(sha256sum "${INSTALL_DIR}trackMe" | cut -d' ' -f1)"; then
  printf 'Checksum creation for %s failed\n' "${INSTALL_DIR}trackMe"
fi

if [ -z "$GIT_TRACKME_HASH" ] || [ -z "$INSTALLED_TRACKME_HASH" ]; then
  printf ' Either Git hash <%s> or Installed hash <%s> is empty - exiting\n' "$GIT_TRACKME_HASH" "$INSTALLED_TRACKME_HASH"
  exit 1
fi

if [ "$GIT_TRACKME_HASH" = "$INSTALLED_TRACKME_HASH" ];then
  printf '%s\n%s\n%s\n' "Hashes are:" "$GIT_TRACKME_HASH" "$INSTALLED_TRACKME_HASH"
  echo "Successfully installed latest version from Git."
else
  echo "Hashes don't match - latest version not installed."
fi

