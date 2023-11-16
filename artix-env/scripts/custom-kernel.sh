#!/usr/bin/bash

git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
# Optional: edit the "customization.cfg" file
sed -i 's/.*configfile.*/_configfile="running-kernel"/' customization.cfg
makepkg -si

rm -rfv linux-tkg/

cat newkernel.cfg >> /boot/limine.cfg

echo "Thats all..."
