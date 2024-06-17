#!/bin/bash

source ./rainbow.sh

gA=$(echogreen "==>")

echo "$gA Updating the System..."

sudo pacman -Syyu

echo "$gA Install Reflector..."
sudo pacman -S reflector

echo "$gA Edit /etc/xdg/reflector/reflector.conf..."
sudo sed -i 's/# --country France,Germany/--country "United States",Chile/g' /etc/xdg/reflector/reflector.conf

echo "$gA Enable and Start reflector.service..."
sudo systemctl enable --now reflector.service
