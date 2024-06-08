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

SRC="~/dotfiles"
DST="~/.config"

for t in ${CONFIGS[@]}; do
	echo "Linking $SRC -> $DST / ($t)..."
	rm -rfv $DST/$t
	ln -sf $SRC/$t $DST/$t
done
