#!/usr/bin/bash
#
#delete Isos older than 30 days
find ~/VMs/Isos/ -type f -mtime +30 -delete

#delete screenshots and pictures older than 5 days
find ~/Pictures/ -type f -mtime +5 -delete
