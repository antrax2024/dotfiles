#!/usr/bin/bash

DOTFILES="$HOME/dotfiles"
HYPRLAND_VOID="$HOME/repos/hyprland-void"
VOID_PACKAGES="$HOME/repos/void-packages"
COMPILE_CMD="./xbps-src pkg "
INSTALL_CMD="sudo xbps-install -R hostdir/binpkgs "
DESTINATION="/var/service"
SOURCE="/etc/sv"


source $DOTFILES/bin/functions.sh


printStatus "Install Hyprland Dependencies.... hummmm"
sudo xbps-install -Su
sudo xbps-install ninja xcb-proto wayland-protocols xorg-server-xwayland libinput wlroots-devel seatd elogind


printStatus "Cloning repos to [$REPOS_DIR]... "
git clone https://github.com/void-linux/void-packages $VOID_PACKAGES
git clone https://github.com/Makrennel/hyprland-void.git $HYPRLAND_VOID

printStatus "Install binary bootstrap..."
cd $VOID_PACKAGES
./xbps-src binary-bootstrap

printStatus "Prepare to compile Hyprland..."
cat $HYPRLAND_VOID/common/shlibs >> $VOID_PACKAGES/common/shlibs
cp -r $HYPRLAND_VOID/srcpkgs/* $VOID_PACKAGES/srcpkgs

printStatus "Compiling Hyprland. "
cd $VOID_PACKAGES
$COMPILE_CMD hyprland

printStatus "Installing...."
$INSTALL_CMD hyprland


printStatus "Compile Waybar... hummmmm"
./xbps-src pkg Waybar
$COMPILE_CMD Waybar
printStatus "Inslall Waybar..."
$INSTALL_CMD Waybar

print "Compile and Install xdg-desktop-portal-hyprland"
$COMPILE_CMD xdg-desktop-portal-hyprland
$INSTALL_CMD xdg-desktop-portal-hyprland


printStatus "Enable seatd..."
sudo ln -s $SOURCE/seatd $DESTINATION

printStatus "Enable elogind..."
sudo ln -s $SOURCE/elogind $DESTINATION
