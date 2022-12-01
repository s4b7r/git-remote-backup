#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

. "$SCRIPT_PATH/ftp.secret"
ftp_user="SFTP USER"
ftp_host="SFTP HOST"
ftp_path="SFTP PATH"
ftp_port="SFTP PORT"
#rclone copy --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass "$SCRIPT_PATH/localbackup/weekly_this_week/" :ftp:$ftp_path/weekly_this_month
#rclone copy --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass "$SCRIPT_PATH/localbackup/daily_last_week/" :ftp:$ftp_path/daily_last_week

echo "doing rclone sync"
rclone sync --sftp-host=$ftp_host --sftp-port=$ftp_port --sftp-user=$ftp_user --sftp-pass=$ftp_pass "$SCRIPT_PATH/localbackup/mirror_destination/" :sftp:$ftp_path/mirror_destination
echo "rclone sync done"
