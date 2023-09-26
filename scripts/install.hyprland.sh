#!/bin/bash
#
#
paru -S dunst fuzzel kitty swaylock waybar-hyprland-git hyprland-git wofi papirus-icon-theme thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman polkit-kde-agent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland nwg-look


sudo pacman -S mpd wget rsync blueman sshfs
sudo systemctl enable --now mpd.service


sudo  pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com

sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'


echo 'Put the following lines in /etc/pacman.conf'
echo '############################################'
echo '[chaotic-aur]'
echo 'Include = /etc/pacman.d/chaotic-mirrorlist '
echo '############################################'


paru -S insync ttf-hack-nerd siji-ng hyprpaper hyprshot ttf-firacode-nerd ttf-font-awesome swayidle wlogout visual-studio-code-bin awesome-terminal-fonts



