#!/bin/bash

sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all
