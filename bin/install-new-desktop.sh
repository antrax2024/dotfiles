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
	cronie
	file-roller
	reflector
	wl-clipboard
	hyprshot
	ntp
	swappy
	okular

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

echo 'Enable cups.service'
sudo systemctl enable cups.service
echo "Enable cronie.service"
sudo systemctl enable cronie.service
echo "Enable reflector.service"
sudo systemctl enable --now reflector.service
sudo systemctl enable --now reflector.timer

echo "Enable ntpd.service"
sudo systemctl enable --now ntpd.service
