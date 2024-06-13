#!/bin/bash

#Install Packages

PACKAGES=(
	firefox-developer-edition
	surfshark-client
	ttf-hack-nerd
	starship
	keepassxc
	eza
	duf
	gdu
	qbittorrent
	onedrivegui
	dunst
	nwg-look
	zapzap
	copyq
	mpv
	wlogout
	thunar
	thunar-archive-plugin
	thunar-media-tags-plugin
	thunar-volman
	plocate
	nvidia-settings
	cups
	cronie
	file-roller
	reflector
	swappy
	okular
	# neovim-git
	neovim-git
	python-virtualenv
	lazygit
	pynvim
	noto-fonts-emoji
	fd
	npm
	nodejs
	python-pip
	python-virtualenv
	ripgrep

	# Hyprland
	hyprland
	hyprcursor
	hypridle
	hyprpaper
	hyprshot
	wl-clipboard

)

paru -S ${PACKAGES[@]}

# Config

CONFIGS=(
	alacritty
	dunst
	fish
	fuzzel
	hypr
	neofetch
	waybar
	swappy
	fontconfig
)

SRC="$HOME/dotfiles"
DST="$HOME/.config"

for t in ${CONFIGS[@]}; do
	echo "Linking $SRC -> $DST / ($t)..."
	ln -sf $SRC/$t $DST/$t
done

SERVICES=(
	cups.service
	cronie.service
	reflector.service
	reflector.timer
)

for s in ${SERVICES[@]}; do
	echo "Enable ($s)..."
	sudo systemctl enable %s
done

echo 'Adjust system clock...'
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo hwclock --systohc

fc-cache -fv

echo 'Finish...'
