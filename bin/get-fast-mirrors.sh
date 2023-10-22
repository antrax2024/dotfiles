#!/usr/bin/bash
#

echo "Update Arch Linux mirror List..."
sudo reflector --protocol https --country Brazil,US --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
