#!/usr/bin/bash
#



echo "Update Arch Linux mirror List..."
export TMPFILE="$(mktemp)" 
sudo true 
rate-mirrors --min-per-mirror=400 --save=$TMPFILE arch 
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup 
sudo mv $TMPFILE /etc/pacman.d/mirrorlist


echo "Update Chaotic-AUR mirrorlist"
cat /dev/null>$TMPFILE

rate-mirrors --min-per-mirror=400 --save=$TMPFILE chaotic-aur 
sudo mv /etc/pacman.d/chaotic-mirrorlist /etc/pacman.d/chaotic-mirrorlist-backup 
sudo mv $TMPFILE /etc/pacman.d/chaotic-mirrorlist 

paru
