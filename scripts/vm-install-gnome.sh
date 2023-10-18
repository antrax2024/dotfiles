#!/usr/bin/bash

paru

sudo systemctl disable greetd.service
paru -S gnome gnome-tweaks gnome-extra gdm spice-vdagent
sudo systemctl enable gdm.service


