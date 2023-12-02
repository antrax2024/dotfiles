#!/usr/bin/bash

DOTFILES="$HOME/dotfiles"
REPOS_DIR="$HOME/repos"

source $DOTFILES/bin/functions.sh

printStatus "Install Hyprland Dependencies.... hummmm"
sudo xbps-install -Su
sudo xbps-install ninja mason xcb-proto wayland-protocols xorg-server-xwayland libinput wlroots-devel


printStatus "Cloning repos to [$REPOS_DIR]... "
git clone https://github.com/void-linux/void-packages $REPOS_DIR
git clone https://github.com/Makrennel/hyprland-void.git $REPOS_DIR

printStatus "Install binary bootstrap..."
cd $REPOS_DIR/void-packages
./xbps-src binary-bootstrap

printStatus "Prepare to compile Hyprland..."
cd $REPOS_DIR/hyprland-void
cat $REPOS_DIR/hyprland-void/common/shlibs >> $REPOS_DIR/void-packages/common/shlibs
cp -r $REPOS_DIR/hyprland-void/srcpkgs/* $REPOS_DIR/void-packages/srcpkgs

printStatus "Compiling Hyprland. "
cd $REPOS_DIR/void-packages
./xbps-src pkg hyprland
