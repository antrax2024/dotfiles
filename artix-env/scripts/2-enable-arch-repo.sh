#!/usr/bin/bash
#
source /home/gargula/dotfiles/bin/functions.sh

TARGET='/etc/pacman.conf'
APPEND_CMD='sudo sed -i'


printStatus "Performing upgrading...."
sudo pacman -Syu



printStatus "Enable artix-archlinux-support..."
sudo pacman -Syu artix-archlinux-support

printStatus "Editing /etc/pacman.conf..."

# Arch repositories
$APPEND_CMD '############################################################' $TARGET
$APPEND_CMD '#Arch repositories' $TARGET
$APPEND_CMD '[extra]' $TARGET
$APPEND_CMD 'Include = /etc/pacman.d/mirrorlist-arch' $TARGET
$APPEND_CMD '#' $TARGET
$APPEND_CMD '[community]' $TARGET
$APPEND_CMD 'Include = /etc/pacman.d/mirrorlist-arch' $TARGET
$APPEND_CMD '#' $TARGET
$APPEND_CMD '[multilib]' $TARGET
$APPEND_CMD 'Include = /etc/pacman.d/mirrorlist-arch' $TARGET
sudo sed -i '############################################################' $TARGET


printStatus "Populating...."
sudo pacman-key --populate archlinux

sudo pacman -Syu



printStatus "Thats all..."




