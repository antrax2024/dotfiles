#!/bin/bash

source "$HOME/dotfiles/bin/rainbow.sh"

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
	zapzap
	copyq
	mpv
	nvidia-settings
	cups
	cronie
	file-roller
	reflector
	okular
	# Thunar
	thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman plocate tumbler
	# pipewire
	pipewire pipewire-audio pipewire-pulse wireplumber pavucontrol
	# bluetooth
	bluez blueman
	# neovim-git
	neovim-git python-virtualenv lazygit pynvim noto-fonts-emoji fd npm nodejs python-pip python-virtualenv ripgrep
	# Hyprland
	hyprland hyprcursor hypridle hyprpaper hyprshot wl-clipboard xdg-desktop-portal-hyprland wlogout swappy nwg-look
)

paru -S "${PACKAGES[@]}"


