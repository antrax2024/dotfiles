#!/usr/bin/bash
#
source /home/gargula/dotfiles/bin/functions.sh


printStatus "Performing upgrading...."
sudo pacman -Syu

printStatus "Enable artix-archlinux-support..."
sudo pacman -Syu artix-archlinux-support







