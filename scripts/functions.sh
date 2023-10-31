#!/usr/bin/bash
################################
# Imprime o status
function printStatus() {
	echo "######################################################"
	echo "$1"
	echo "######################################################"
	sleep 2
}

function verifyIfConfigExists() {
	DIRECTORY="$HOME/.config/$1"
	if [ -d "$DIRECTORY" ]; then
  	rm -rfv $DIRECTORY
	fi
}


