#!/usr/bin/bash


if [ $# -lt 2 ]
  then
    echo "Use ./create-usb-stick.sh [imagem-file] [device]"
  else 
    echo 'hummm...'
    sudo dd bs=4M if=archlinux-2023.10.14-x86_64.iso of=/dev/sda status=progress oflag=sync
fi

