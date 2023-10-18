#!/usr/bin/bash
#
echo "Instalando nvidia-dkms...."

paru -S nvidia-dkms nvidia-utils nvidia-settings opencl-nvidia qt5-wayland qt5ct libva libva-nvidia-driver-git


sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/g' /etc/mkinitcpio.conf

sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-linux-tkg-bmq.img

sudo echo 'options nvidia-drm modeset=1' >> /etc/modprobe.d/nvidia.conf
