#!/bin/bash



while true
do
	if pidof -o %PPID -x "fauxmo">/dev/null; then
		echo "Fauxmo already running"
	else
		echo "Fauxmo not running..."
		$HOME/.local/bin/fauxmo -c $HOME/dotfiles/fauxmo/config.json
		echo "Down..."
	fi
	sleep 5
done
