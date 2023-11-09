#!/usr/bin/bash

#sudo pacman -Syy
#sudo pacman -S qemu-full virt-manager dnsmasq vde2 \
#bridge-utils openbsd-netcat dmidecode ebtables iptables libguestfs \
#edk2-ovmf swtpm libvirt-runit


sudo nvim /etc/libvirt/libvirtd.conf

sudo usermod -aG libvirt $USER

sudo ln -s /etc/runit/sv/libvirtd /run/runit/service/
sudo sv up libvirtd

sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all

