#!/usr/bin/bash
sudo nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration

nvidia-smi -i 0 -f 75
