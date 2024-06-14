#!/bin/bash

source rainbow.sh

echoblue "*****************************"
echoyellow "Cloning Repository..."
echoblue "*****************************"
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si

echogreen 'Finish...'
