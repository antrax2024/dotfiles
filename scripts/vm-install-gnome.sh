#!/bin/bash

paru

sudo systemctl disable greetd.service
paru -S gnome gnome-tweaks gnome-extra gdm
sudo systemctl enable gdm.service


