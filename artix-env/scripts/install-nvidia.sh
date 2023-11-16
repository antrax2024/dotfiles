# CONFIG VARS
#

source ../../bin/functions.sh
source ../../bin/packages-artix.sh

printStatus "Install DKMS drivers..."
paru -S nvidia-dkms nvidia-utils nvidia-settings

sudo ln -sf /home/gargula/dotfiles/artix-env/etc/modprobe.d/nvidia.conf /etc/modprobe.d/nvidia.conf

printStatus "Append: nvidia nvidia_modeset nvidia_uvm nvidia_drm to Modules mkinitcpio.conf"

printStatus "Run: mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-linux66-tkg-bore.img"

printStatus "Append the following kernel parameter: nvidia_drm.modeset=1"

printStatus "Thats all"
