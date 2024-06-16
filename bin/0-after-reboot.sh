#!/bin/bash

source ./rainbow.sh

echoyellow 'Adjust Grub...'

sudo sed -i 's/loglevel=3 quiet/loglevel=3 nvidia_drm.modeset=1/g' /etc/default/grub
sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g' /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg
