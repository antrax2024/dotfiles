#!/bin/bash

function run {
	if ! pgrep "$1"; then
		"$@" &
	fi
}

run hypridle
run dunst
run jamesdsp -t

sleep 5
/usr/bin/keepassxc &
/home/antrax/dotfiles/bin/nvidiafan.sh &
blueberry-tray &
onedrivegui &
a2ln &
