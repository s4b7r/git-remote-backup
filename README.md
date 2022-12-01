# Git remote backup

This is a controller and target for remote Git backups. It does a `remote update` on local mirror repositories to get local backups and pushes it to an additional backup destionation.

## Setup

1. Create direcotries on the additional backup destionation:
   - `$ftp_path/weekly_this_month`
   - `$ftp_path/weekly_last_month`
   - `$ftp_path/daily_last_week`
   - `$ftp_path/daily_2nd_week`
2. Run `1-create-localdir.sh`
3. In `<SCRIPT PATH>/mirror_destination` do `git clone --mirror` for all repos you want to backup.
4. Make sure your system is configured so that git does not need you to manually authenticate with the remote.
5. `chmod u+x git-backup_do_*.sh`
6.  Run `requirements.sh`
7.  Create `ftp.secret` from `ftp.secret.sample`
8.  Fill all necessary variables in the script files.
    - **I am sorry, this must be made easier in the future.**
    - Caution: some places still name it FTP but actually SFTP is used now.
9.  Add `git-backup_do_*.sh` scripts to crontab: use `crontab -e` or put into `/etc/crontab`, e.g.:
    -  `0  19 *   * *   <SCRIPT PATH>/git-backup_do_daily.sh`
    -  `45 12 1-7 * *   [ $(date +\%u) -eq 5 ] && <SCRIPT PATH>/git-backup_do_monthly.sh` (Does it on the first Friday in every month on my system. Please check for yours.)
    -  `0  13 *   * FRI <SCRIPT_PATH>/git-backup_do_weekly.sh`
10. Currently VPN connection is hardcoded for connection to remote host.
    - You need to get those scripts or remove them.
    - This script expects VPN scripts in `$HOME/scripts/vpn`, e.g. see [Cisco VPN scripts](https://github.com/s4b7r/cisco-vpn-scripts)
