#!/usr/bin/bash
#
source /home/gargula/dotfiles/bin/functions.sh

TARGET='/etc/pacman.conf'

printStatus "Editing $TARGET"
sudo nvim $TARGET

printStatus "Performing upgrading...."
sudo pacman -Syu

printStatus "Enable artix-archlinux-support..."
sudo pacman -Syu artix-archlinux-support

printStatus "Editing /etc/pacman.conf..."
su
cat ./arch-repos.conf >> $TARGET
exit


printStatus "Populating...."
sudo pacman-key --populate archlinux

sudo pacman -Syu

printStatus "Thats all..."




