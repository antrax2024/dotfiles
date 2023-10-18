#!/usr/bin/bash


result=$(ps -ef | grep "fauxmo" | grep -v grep | wc -l | xargs)

if [ $result -gt 2 ]; then
	echo -e "The SCRIPT was already running!"
	exit 0
else
	echo -e "NÃO!!!"
	/home/gargula/.local/bin/fauxmo -c $HOME/dotfiles/fauxmo/config.json
	exit 0
fi 

