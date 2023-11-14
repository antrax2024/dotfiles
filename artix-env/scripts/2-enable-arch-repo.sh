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

printStatus "Please append file arch-repos.conf to $TARGET"

printStatus "After populating with sudo pacman-key --populate archlinux"

printStatus "Thats all..."




