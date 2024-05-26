#!/bin/bash

CONFIGS=(
	alacritty
	nvim
	bspwm
	neofetch
	fish
	polybar
)

DST="~/.config"
SRC="~/dotfiles"

for t in ${CONFIGS[@]}; do
	echo "Link $DST / $t..."
	rm -rfv $DST/$t
	ln -sf $SRC/$t $DST/$t
done
