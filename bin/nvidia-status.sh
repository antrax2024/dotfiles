#!/usr/bin/bash
#export LC_NUMERIC="en_US.UTF-8"

TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)

UTILIZATION=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader)


#echo "$UTILIZATION $TEMP °C"

printf "%s" $UTILIZATION
printf " %2d°C\n" $TEMP
