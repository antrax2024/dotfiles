#!/bin/bash

sudo pacman -Syy
sudo pacman -S archlinux-keyring
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 \
bridge-utils openbsd-netcat dmidecode ebtables iptables libguestfs


sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

sudo vim /etc/libvirt/libvirtd.conf

sudo usermod -aG libvirt $USER

sudo systemctl restart libvirtd.service

sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all

