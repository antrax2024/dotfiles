#!/usr/bin/bash
#
echo "Instalando nvidia-dkms...."

paru -S nvidia-dkms nvidia-utils nvidia-settings opencl-nvidia qt5ct libva libva-nvidia-driver-git


sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/g' /etc/mkinitcpio.conf

sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-linux-tkg-bmq.img

sudo cp ../etc/modprobe.d/nvidia.conf /etc/modprobe.d/

echo "Coloca sudo nvidia-settings sem password... Visudo!"
