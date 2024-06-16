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
	xorg-xhost
	ntfs-3g
	# Thunar
	thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman plocate tumbler
	# pipewire
	pipewire pipewire-audio pipewire-pulse wireplumber pavucontrol
	# bluetooth
	bluez blueman
	# neovim-git
	neovim-git python-virtualenv lazygit python-pynvim noto-fonts-emoji fd npm nodejs python-pip python-virtualenv ripgrep
	# Hyprland
	hyprland hyprcursor hypridle hyprpaper hyprshot wl-clipboard xdg-desktop-portal-hyprland
	wlogout swappy nwg-look sddm archlinux-themes-sddm numlockx
)

paru -S "${PACKAGES[@]}"

# Config
mkdir ~/.config

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
	bluetooth.service
	sddm.service
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
