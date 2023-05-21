#!/bin/bash

if [ -f ./trackMe ];then
  TRACKME_SCRIPT="./trackMe"
elif [ -f ../trackMe ];then
  TRACKME_SCRIPT="../trackMe"
else
  echo "Could not find executable in ./ or ../ - exiting"
  exit 1
fi

if ! GIT_TRACKME_HASH="$(sha256sum "$TRACKME_SCRIPT" | cut -d' ' -f1)"; then
  printf 'Checksum creation for %s failed\n' "$TRACKME_SCRIPT"
  exit 1
fi

INSTALL_DIR="/usr/local/bin/"
if ! CURRENTLY_INSTALLED_TRACKME_HASH="$(sha256sum "${INSTALL_DIR}trackMe" | cut -d' ' -f1)"; then
  printf 'Checksum creation for %s failed\n' "${INSTALL_DIR}trackMe"
  exit 1
fi

if [ -z "$GIT_TRACKME_HASH" ] || [ -z "$CURRENTLY_INSTALLED_TRACKME_HASH" ]; then
  printf ' Either Git hash <%s> or Installed hash <%s> is empty - exiting\n' "$GIT_TRACKME_HASH" "$CURRENTLY_INSTALLED_TRACKME_HASH"
  exit 1
fi

printf 'Installed version hash: %s\n      Git version hash: %s\n' "$CURRENTLY_INSTALLED_TRACKME_HASH" "$GIT_TRACKME_HASH"
if [ "$GIT_TRACKME_HASH" = "$CURRENTLY_INSTALLED_TRACKME_HASH" ]; then
  echo "Current version already installed, nothing to do"
  exit 0
fi

sudo cp -v "$TRACKME_SCRIPT" "${INSTALL_DIR}trackMe"

if ! CURRENTLY_INSTALLED_TRACKME_HASH="$(sha256sum "${INSTALL_DIR}trackMe" | cut -d' ' -f1)"; then
  printf 'Checksum creation for %s failed\n' "${INSTALL_DIR}trackMe"
  exit 1
fi

if [ "$GIT_TRACKME_HASH" = "$CURRENTLY_INSTALLED_TRACKME_HASH" ];then
  echo "Successfully installed latest version from Git."
  printf 'Installed version hash: %s\n      Git version hash: %s\n' "$CURRENTLY_INSTALLED_TRACKME_HASH" "$GIT_TRACKME_HASH"
else
  echo "Hashes don't match - latest version not installed."
fi

