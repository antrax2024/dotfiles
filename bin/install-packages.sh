#!/bin/bash

PACKAGES=(
	firefox-developer-edition
	surfshark-client
	ventoy
	gthumb
	ttf-hack-nerd
	neovim-git
	python-virtualenv
	starship
	keepassxc
	eza
	duf
	gdu
	qbittorrent
	onedrivegui
)

paru -S ${PACKAGES[@]}
