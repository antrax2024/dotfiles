#!/usr/bin/bash

sudo virsh net-define bridged-network.xml
sudo virsh net-start bridged-network
sudo virsh net-autostart bridged-network
sudo virsh net-list
