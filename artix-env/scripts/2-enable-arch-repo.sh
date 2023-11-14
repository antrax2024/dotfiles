#!/usr/bin/bash
#
source /home/gargula/dotfiles/bin/functions.sh

TARGET='/etc/pacman.conf'


printStatus "Performing upgrading...."
sudo pacman -Syu

printStatus "Enable artix-archlinux-support..."
sudo pacman -Syu artix-archlinux-support

printStatus "Editing /etc/pacman.conf..."

# Arch repositories
sudo sed -i -e '############################################################' $TARGET
sudo sed -i -e '#Arch repositories' $TARGET
sudo sed -i -e '[extra]' $TARGET
sudo sed -i -e 'Include = /etc/pacman.d/mirrorlist-arch' $TARGET

sudo sed -i -e '[community]' $TARGET
sudo sed -i -e 'Include = /etc/pacman.d/mirrorlist-arch' $TARGET

sudo sed -i -e '[multilib]' $TARGET
sudo sed -i -e 'Include = /etc/pacman.d/mirrorlist-arch' $TARGET
sudo sed -i -e '############################################################' $TARGET


printStatus "Populating...."
sudo pacman-key --populate archlinux

sudo pacman -Syu



printStatus "Thats all..."




