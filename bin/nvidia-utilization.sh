#!/usr/bin/bash

UTILIZATION=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader)

number=$(echo $UTILIZATION | sed 's/%//g')

#printf "%d\r\n" $UTILIZATION

printf "%.2f\r\n" $number
