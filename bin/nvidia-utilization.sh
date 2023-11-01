#!/usr/bin/bash

UTILIZATION=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader)

echo $UTILIZATION

