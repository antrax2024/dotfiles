#!/usr/bin/bash
#export LC_NUMERIC="en_US.UTF-8"

TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)

printf "%s\n" $TEMP
