#!/bin/sh

# # run this once a week (or 2 week or 1 month or .......)
# # backup my files to my usb (i have one btw)
#
# # get path of drive with lsblk
#
# # takes path from stdin
MEDIA_PATH="$1"

if  [ ! -d  "$MEDIA_PATH" ]; then
  echo "[ERROR] Backup drive not found!"
  exit
fi

# backup nixos config
rsync -arvh --progress ~/nixos                  "$MEDIA_PATH"

# backup osu folder (songs and skins only)
rsync -arvh --progress ~/.osu/drive_c/osu/Songs "$MEDIA_PATH/osu"
rsync -arvh --progress ~/.osu/drive_c/osu/Skins "$MEDIA_PATH/osu"

# backup study materials
rsync -arvh --progress ~/study "$MEDIA_PATH"

# backup coding stuff

rsync -arvh --progress ~/childpo                "$MEDIA_PATH"
# backup agenix key pair

mkdir -p "$MEDIA_PATH/agenix"

rsync -avh --progress /etc/ssh/agenix_ed25519     "$MEDIA_PATH/agenix"
rsync -avh --progress /etc/ssh/agenix_ed25519.pub     "$MEDIA_PATH/agenix"

# backup
rsync -avh --progress ~/.pw/Passwords.kdbx "$MEDIA_PATH/Passwords.kdbx" 
