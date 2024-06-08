#!/bin/bash

function run {
	if ! pgrep $1; then
		$@ &
	fi
}

run hypridle

sleep 5
/usr/bin/keepassxc &
/home/gargula/dotfiles/bin/nvidiafan.sh &
