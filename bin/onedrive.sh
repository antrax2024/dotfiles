#!/bin/bash

#rclone --vfs-cache-mode=writes mount "OneDrive":  ~/OneDrive & disown
rclone --vfs-cache-mode=full --dir-cache-time=1000h --onedrive-chunk-size=150M mount "OneDrive":  ~/OneDrive
