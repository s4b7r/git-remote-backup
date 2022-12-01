#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

echo "-----Now connecting VPN...-----"
"$HOME/scripts/vpn/vpnconnect.sh"
echo "-----VPN should be connected-----"

echo "Removing weekly_this_week/*..."
rm $SCRIPT_PATH/localbackup/weekly_this_week/*

echo "-----Updating mirrors...-----"
cd $SCRIPT_PATH/localbackup/mirror_destination
for D in *; do
    if [ -d "${D}" ]; then
        echo $D
        cd $D
        echo `pwd`
        git remote update
        cd ..
    fi
done
echo "-----Mirrors updated-----"

cd $SCRIPT_PATH
7z a "$SCRIPT_PATH/localbackup/weekly_this_week/weekly_this_week_$(date +%Y-%m-%d).7z" "$SCRIPT_PATH/localbackup/mirror_destination/*"

"$HOME/scripts/vpn/vpndisconnect.sh"

