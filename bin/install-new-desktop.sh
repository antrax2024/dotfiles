#!/bin/bash

#Install Packages

PACKAGES=(
	firefox-developer-edition
	surfshark-client
	ttf-hack-nerd
	neovim-git
	python-virtualenv
	starship
	keepassxc
	eza
	duf
	gdu
	fd
	lazygit
	npm
	nodejs
	python-pip
	python-virtualenv
	qbittorrent
	onedrivegui
	dunst
	nwg-look
	zapzap
	copyq
	hypridle
	mpv
	hyprpaper
	wlogout
	thunar
	thunar-archive-plugin
	thunar-media-tags-plugin
	thunar-volman
	ripgrep
	plocate
	nvidia-settings
	cups

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
)

SRC="$HOME/dotfiles"
DST="$HOME/.config"

for t in ${CONFIGS[@]}; do
	echo "Linking $SRC -> $DST / ($t)..."
	ln -sf $SRC/$t $DST/$t
done

echo 'Enable cups service'
sudo systemctl enable cups.service
