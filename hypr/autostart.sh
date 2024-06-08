#!/bin/bash

function run {
	if ! pgrep $1; then
		$@ &
	fi
}

sleep 5
/usr/bin/keepassxc &
/home/gargula/dotfiles/bin/nvidiafan.sh &
