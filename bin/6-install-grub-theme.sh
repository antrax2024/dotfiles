#!/bin/bash

source "./rainbow.sh"

gA=$(echogreen "==>")

echo "$gA Cloning Repository..."

git clone --depth 1 https://gitlab.com/VandalByte/darkmatter-grub-theme.git
cd darkmatter-grub-theme || 1
sudo python3 darkmatter-theme.py --install

rm -rfv darkmatter-grub-theme

echo "$gA Finish..."
