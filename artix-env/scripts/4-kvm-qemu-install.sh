#!/usr/bin/bash

sudo pacman -Syu

PKGS=(
  extra/qemu-full
  extra/virt-manager
  extra/virt-viewer
  extra/dnsmasq
  extra/vde2
  extra/bridge-utils
  extra/openbsd-netcat
  extra/dmidecode
  system/iptables-nft
  system/iptables
  extra/libguestfs
  extra/edk2-ovmf
  extra/swtpm
  world/libvirt-runit
)


paru -S ${PKGS[*]}



sudo nvim /etc/libvirt/libvirtd.conf

sudo usermod -aG libvirt $USER
sudo ln -s /etc/runit/sv/libvirtd /run/runit/service/
sudo ln -s /etc/runit/sv/virtlogd/ /run/runit/service/
sudo ln -s /etc/runit/sv/virtlockd/ /run/runit/service/


sudo sv up libvirtd
sudo sv up virtlogd
sudo sv up virtlockd

sleep 3
sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all

