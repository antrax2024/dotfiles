#!/bin/bash

source "./rainbow.sh"

gA=$(echogreen "==>")

echo "$gA Cloning Repository..."
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
makepkg -si

echo "$gA Finish..."
