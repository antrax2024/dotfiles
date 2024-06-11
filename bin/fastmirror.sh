#!/bin/bash

sudo rate-mirrors \
	--save /etc/pacman.d/mirrorlist \
	--allow-root \
	--protocol https \
	arch
