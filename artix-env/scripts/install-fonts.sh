#!/bin/sh
echo "Setting up Noto Emoji font..."
# 1 - install  noto-fonts-emoji package
sudo pacman -S noto-fonts-emoji --needed
# pacman -S powerline-fonts --needed
echo "Recommended system font: inconsolata regular (ttf-inconsolata or powerline-fonts)"
# 2 - add font config to /etc/fonts/conf.d/01-notosans.conf
sudo cp local.conf /etc/fonts/
# 3 - update font cache via fc-cache
fc-cache -fv
echo "Noto Emoji Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, your default font contains emojis."
echo "consider inconsolata regular"


