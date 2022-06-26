#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

mkdir -p "$SCRIPT_PATH/localbackup/mirror_destination"
mkdir -p "$SCRIPT_PATH/localbackup/daily_this_week"
mkdir -p "$SCRIPT_PATH/localbackup/daily_last_week"
mkdir -p "$SCRIPT_PATH/localbackup/weekly_this_week"
mkdir -p "$SCRIPT_PATH/localbackup/weekly_this_month"
mkdir -p "$SCRIPT_PATH/localbackup/weekly_last_month"
