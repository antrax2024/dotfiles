#!/bin/bash

source ./rainbow.sh

gA=$(echogreen "==>")

echo "$gA Adjust Grub..."

sudo sed -i 's/loglevel=3 quiet/loglevel=3 nvidia_drm.modeset=1/g' /etc/default/grub
sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g' /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "$gA Install and enable Network Time Protocol - NTP..."

sudo pacman -Syyu
sudo pacman -S ntp

echo "$gA Time Sync Start"
echo "$gA Please, wait..."
sudo systemctl enable --now ntpdate.service
