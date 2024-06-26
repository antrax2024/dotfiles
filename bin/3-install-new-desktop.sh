#!/bin/bash

source "./rainbow.sh"
source "./packages.sh"

gA=$(echogreen "==>")

#Install Packages
echo "$gA Install Packages..."

paru -S "${PACKAGES[@]}"

echo "$gA Link config files..."

# Config
mkdir ~/.config

CONFIGS=(
	alacritty
	swaync
	fish
	fuzzel
	hypr
	neofetch
	waybar
	swappy
	fontconfig
	wlogout
	wireplumber
)

SRC="$HOME/dotfiles"
DST="$HOME/.config"

for t in "${CONFIGS[@]}"; do
	echo "$gA Linking $SRC -> $DST / ($t)..."
	ln -sf "$SRC/$t" "$DST/$t"
done

SERVICES=(
	cups.service
	cronie.service
	bluetooth.service
	sddm.service
	avahi-daemon.service
	systemd-homed.service
)

echo "$gA Enable Services..."

for s in "${SERVICES[@]}"; do
	echo "$gA Enable ($s)..."
	sudo systemctl enable "$s"
done

echo "$gA Adjust system clock..."
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo hwclock --systohc

echo "$gA Edit sddm files"
sudo mkdir -p /etc/sddm.conf.d/
sudo cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
sudo sed -i 's/Numlock=none/Numlock=on/g' /etc/sddm.conf.d/default.conf
sudo sed -i 's/Current=/Current=archlinux-simplyblack/g' /etc/sddm.conf.d/default.conf

fc-cache -fv

echo "$gA Change bash -> fish..."
chsh -s /usr/bin/fish antrax

echo 'Finish...'
