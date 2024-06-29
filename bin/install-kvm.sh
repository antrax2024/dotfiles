#!/bin/bash

source ./rainbow.sh

gA=$(echogreen "==>")

echo "$gA Installl all necessary...."
paru -S qemu-full virt-manager virt-viewer dnsmasq bridge-utils libguestfs ebtables vde2 openbsd-netcat

echo "$gA Enable and start libvirtd.service..."
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

echo "$gA Editing libvirtd.conf"
sudo nvim /etc/libvirt/libvirtd.conf

echo "$gA add your user to libvirt group..."
sudo usermod -aG libvirt "$USER"

echo "$gA Restart the service..."
sudo systemctl restart libvirtd.service

echo "$gA Enable and autostart default network..."
sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all

echo "$gA That´s ok!"
