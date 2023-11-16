#!/usr/bin/bash

git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
# Optional: edit the "customization.cfg" file
sed -i 's/.*configfile.*/_configfile="running-kernel"/' customization.cfg
makepkg -si

cd ../
rm -rfv linux-tkg/


echo "Please edit /boot/limine.cfg and add entry to new kernel..."


echo "Thats all..."
