#!/usr/bin/bash
PKGS=$(cat <<-END
	#########################
	# APPS
	#########################
	xtools
	neovim
	avahi
	dbus
	firefox
	nodejs
	eza
	gimp
	nmap
	bat
	gdu
	duf
	starship
	dunst
	obs
	neofetch
	pipewire
	pipewire-pulse
	pipewire-alsa
	pipewire-jack
	wireplumber
	bluez
	bluez-utils
	blueberry
	thunar
	thunar-archive-plugin
	thunar-media-tags-plugin
	thunar-volman
	file-roller
	tumbler
	cmake
	mlocate
	lazygit
	ripgrep
	telegram-desktop
	discord
	pavucontrol
	cronie
	grim
	slurp
	ethtool
	keepassxc
	imagemagick
	#########################
	# Print Service
	cups
	hplip
	#########################
	#Python Packages
	python-pyserial
	python3-psutil
	#########################
	# Hyprland Correlated 
	# Packages
	qt6-wayland
	qt5-wayland
	polkit-kde-agent
	fuzzel
	copyq
	xdg-desktop-portal-gtk
	qview
	wofi
	swayidle
	kitty
	cava
	#########################
	# Themes
	nwg-look
	papirus-icon-theme
	breeze
	adwaita-plus
	adwaita-qt
	#########################
	# FONTS 
	#########################
	nerd-fonts-ttf
	#########################
END
)

LINK_DIRS=(
	kitty
	dunst
	fish
	neofetch
	hypr
	waybar
	wpaperd
	cava
	fuzzel
)


