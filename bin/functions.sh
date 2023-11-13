#!/usr/bin/bash
################################
# Imprime o status
source /home/gargula/dotfiles/bin/tint.sh
function printStatus() {
	tint "yellow(######################################################)"
	tint "bold(%s)" "green($1)"
	tint "yellow(######################################################)"
	sleep 1
}

function verifyIfConfigExists() {
	DIRECTORY="$HOME/.config/$1"
	if [ -d "$DIRECTORY" ]; then
  	rm -rfv $DIRECTORY
	fi
}


