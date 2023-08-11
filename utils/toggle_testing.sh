#!/bin/bash

GIT_REPO="$HOME/.trackme"
ACTIVE_TIMER="$HOME/.trackme/active"
ON_OR_OFF="$1"

git_sync_on()
{
  if [ -z "$TRACKME_GITSYNC" ] || [ "$TRACKME_GITSYNC" = "no" ]; then
    export TRACKME_GITSYNC="yes"
    echo "Git sync enabled ✓"
  elif [ -n "$TRACKME_GITSYNC" ] && [ "$TRACKME_GITSYNC" = "yes" ]; then
    echo "Git sync already on ✓"
  fi
}

git_sync_off()
{
  if [ -n "$TRACKME_GITSYNC" ] && [ "$TRACKME_GITSYNC" = "yes" ]; then
    unset TRACKME_GITSYNC
    echo "Git sync disabled ✓"
  elif [ -z "$TRACKME_GITSYNC" ] || [ "$TRACKME_GITSYNC" = "no" ]; then
    echo "Git sync already off ✓"
  else
    echo "ERROR: No git sync file ✗"
  fi
}

save_current_working_state()
{
  if [ -f "$ACTIVE_TIMER" ] && [ ! -f "$ACTIVE_TIMER.STATE" ];then
    mv "$ACTIVE_TIMER" "$ACTIVE_TIMER.STATE"
    echo "Current timer state saved ✓"
  elif [ -f "$ACTIVE_TIMER.STATE" ];then
    echo "Current timer state already saved ✓"
  fi
}

restore_current_working_state()
{
  if [ -f "$ACTIVE_TIMER.STATE" ];then
    mv "$ACTIVE_TIMER.STATE" "$ACTIVE_TIMER"
    echo "Current timer state restored ✓"
  else
    echo "No state to restore from, moving current active to /tmp"
    mv "$ACTIVE_TIMER" /tmp/
  fi
}

reset_git_to_master()
{
  pushd "$GIT_REPO" || echo "ERROR: Could not enter Git repo ✗"
  git reset origin/master --hard
  popd || echo "ERROR: Could not return from Git repo ✗"
}

echo "This script must be sourced in the current shell for changes to take effect!"
case "$ON_OR_OFF" in
  "off")
    git_sync_on
    restore_current_working_state
    reset_git_to_master
    ;;
  "on")
    git_sync_off
    save_current_working_state
    ;;
  *)
    echo "Usage: . $0 <on,off>"
    ;;
esac
