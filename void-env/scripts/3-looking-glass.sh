#!/usr/bin/bash

DOTFILES="$HOME/dotfiles"
COMPILE_CMD="./xbps-src pkg "
INSTALL_CMD="sudo xbps-install -R hostdir/binpkgs "
DESTINATION="/var/service"
SOURCE="/etc/sv"


source $DOTFILES/bin/functions.sh

printStatus "Install Dependencies.... hummmm"
sudo xbps-install -Syu binutils-devel cmake freefont-ttf fontconfig-devel SDL2-devel SDL2_ttf-devel spice-protocol libX11-devel libXpresent-devel libXinerama-devel nettle-devel gcc make pkg-config

printStatus "Clone the Repository..."
git clone --recursive https://github.com/gnif/LookingGlass.git 

printStatus "Building..."
cd LookingGlass
mkdir -p client/build
cmake ../
make
sudo make install

printStatus "Finish..."

