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
	pynvim
	noto-fonts-emoji

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
	ntpd.service
)

for s in ${SERVICES[@]}; do
	echo "Enable ($s)..."
	sudo systemctl enable %s
done

echo 'Adjust system clock...'
sudo timedatectl set-local-rtc 1 --adjust-system-clock

echo 'Finish...'
