#!/usr/bin/bash

source ~/dotfiles/bin/functions.sh
SERVICE='/run/runit/service'

printStatus "Updating..."

sudo pacman -Syu

PKGS=(
  qemu-full
  virt-manager
  virt-viewer
  dnsmasq
  vde2
  bridge-utils
  openbsd-netcat
  dmidecode
  iptables-nft
  iptables
  libguestfs
  edk2-ovmf
  swtpm
  libvirt-runit
)

printStatus "Installing packages..."

paru -S ${PKGS[*]}



sudo nvim /etc/libvirt/libvirtd.conf

sudo usermod -aG libvirt $USER
sudo ln -s /etc/runit/sv/libvirtd $SERVICE
sudo ln -s /etc/runit/sv/virtlogd $SERVICE
sudo ln -s /etc/runit/sv/virtlockd $SERVICE


#sudo sv up libvirtd
#sudo sv up virtlogd
#sudo sv up virtlockd
printStatus "Wait 5 seconds, baby..."
sleep 5
sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all


printStatus "reboot your system, baby..."
