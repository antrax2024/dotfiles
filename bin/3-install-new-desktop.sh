#!/bin/bash

source "./rainbow.sh"

#Install Packages

PACKAGES=(
	# Utils
	firefox-developer-edition
	surfshark-client
	starship
	keepassxc
	qbittorrent
	onedrivegui
	zapzap
	mpv
	nvidia-settings
	okular
	# System
	cronie
	cups
	xorg-xhost
	ntfs-3g
	dmidecode
	# Thunar
	thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman
	plocate tumbler file-roller
	# pipewire
	pipewire pipewire-audio pipewire-pulse wireplumber pavucontrol
	# bluetooth
	bluez blueman
	# neovim-git
	neovim-git python-virtualenv lazygit python-pynvim noto-fonts-emoji fd npm nodejs python-pip python-virtualenv ripgrep
	# Hyprland
	hyprland hyprcursor hypridle hyprpaper hyprshot wl-clipboard xdg-desktop-portal-hyprland
	wlogout swappy nwg-look sddm-git archlinux-themes-sddm sddm-kcm
	alacritty-git neofetch-git copyq dunst
	# Shell
	eza duf gdu fish-git ttf-hack-nerd reflector
	# Nvidia
	nvidia-dkms
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

for t in "${CONFIGS[@]}"; do
	echo "Linking $SRC -> $DST / ($t)..."
	ln -sf "$SRC/$t" "$DST/$t"
done

SERVICES=(
	cups.service
	cronie.service
	reflector.service
	reflector.timer
	bluetooth.service
	sddm.service
)

for s in "${SERVICES[@]}"; do
	echo "Enable ($s)..."
	sudo systemctl enable %s
done

echoyellow "Adjust system clock..."
sudo timedatectl set-local-rtc 1 --adjust-system-clock
sudo hwclock --systohc

echoyellow "Edit sddm files"
sudo cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf.d/default.conf
sudo sed -i 's/Numlock=none/Numlock=on/g' /etc/sddm.conf.d/default.conf
sudo sed -i 's/Current=/Current=archlinux-simplyblack/g' /etc/sddm.conf.d/default.conf

fc-cache -fv

echo 'Finish...'
