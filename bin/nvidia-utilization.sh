#!/usr/bin/bash
#export LC_NUMERIC="en_US.UTF-8"

UTILIZATION=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader)

echo $UTILIZATION | sed 's/%//g'
