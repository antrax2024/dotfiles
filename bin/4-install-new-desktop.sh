#!/bin/bash

source "./rainbow.sh"

gA=$(echogreen "==>")

#Install Packages
PACKAGES=(
	# Utils
	firefox surfshark-client keepassxc qbittorrent
	onedrivegui zapzap 64gram-desktop mpv nvidia-settings okular yt-dlp
	qmplay2-git btop lsb-release
	# System
	cronie cups xorg-xhost ntfs-3g dmidecode
	# Thunar
	thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman
	plocate tumbler file-roller
	# pipewire
	pipewire pipewire-audio pipewire-pulse wireplumber pavucontrol jamesdsp
	# bluetooth
	bluez blueman bluez-utils
	# neovim-git
	neovim-git python-virtualenv lazygit python-pynvim noto-fonts-emoji fd npm nodejs python-pip python-virtualenv ripgrep
	# Hyprland
	hyprland hyprcursor hypridle hyprpaper hyprshot wl-clipboard xdg-desktop-portal-hyprland
	wlogout swappy nwg-look sddm-git archlinux-themes-sddm sddm-kcm
	alacritty-git neofetch-git copyq dunst fuzzel waybar-git
	# Shell
	eza duf gdu fish-git ttf-hack-nerd reflector starship
	# Nvidia
	nvidia-dkms
	#xfce
	xfce4 xfce4-goodies
	# Themes
	arc-gtk-theme papirus-icon-theme breeze
)

echo "$gA Install Packages..."

paru -S "${PACKAGES[@]}"

echo "$gA Link config files..."

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
	echo "$gA Linking $SRC -> $DST / ($t)..."
	ln -sf "$SRC/$t" "$DST/$t"
done

SERVICES=(
	cups.service
	cronie.service
	bluetooth.service
	sddm.service
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
