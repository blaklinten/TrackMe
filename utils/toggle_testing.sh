#!/bin/bash

GIT_SYNC_FLAG="$HOME/.TRACKME_GIT_SYNC"
GIT_REPO="$HOME/.trackme"
ACTIVE_TIMER="$HOME/.trackme/active"
ON_OR_OFF="$1"

git_sync_on()
{
  if [ -f "$GIT_SYNC_FLAG.OFF" ]; then
    mv "$GIT_SYNC_FLAG.OFF" "$GIT_SYNC_FLAG"
    echo "Git sync enabled ✓"
  elif [ -f "$GIT_SYNC_FLAG" ]; then
    echo "Git sync already on ✓"
  else
    echo "ERROR: No git sync file ✗"
  fi
}

git_sync_off()
{
  if [ -f "$GIT_SYNC_FLAG" ]; then
    mv "$GIT_SYNC_FLAG" "$GIT_SYNC_FLAG.OFF"
    echo "Git sync disabled ✓"
  elif [ -f "$GIT_SYNC_FLAG.OFF" ];then
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
