#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

echo "-----Doing host week rotation...-----"
. "$SCRIPT_PATH/host-week-rotation.sh"
#. "$SCRIPT_PATH/nas-week-rotation.sh"

echo "-----Doing weekly backup from source...-----"
. "$SCRIPT_PATH/backup-from-remote-weekly.sh"
echo "-----Pushing backup to target...-----"
. "$SCRIPT_PATH/backup-to-target.sh"
echo "-----Done backing up-----"
