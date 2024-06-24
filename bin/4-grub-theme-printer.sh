#!/bin/bash

source "./rainbow.sh"

gA=$(echogreen "==>")

echo "$gA Cloning Repository..."

git clone --depth 1 https://gitlab.com/VandalByte/darkmatter-grub-theme.git
cd darkmatter-grub-theme || 1
sudo python3 darkmatter-theme.py --install

echo "$gA Editing /etc/default/grub..."

sudo sed -i 's/GRUB_GFXMODE=auto/GRUB_GFXMODE=2560x1080/g' /etc/default/grub
sudo grub-mkconfig -o /boo/grub/grub.cfg

rm -rfv darkmatter-grub-theme

echo "$gA Install PPD for HP 107W..."

cd "../hp107w/" || 1
./install-printer.sh

echo "$gA Finish..."
