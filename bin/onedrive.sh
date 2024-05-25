#!/bin/bash

#rclone --vfs-cache-mode=writes mount "OneDrive":  ~/OneDrive & disown
rclone --vfs-cache-mode=writes --onedrive-chunk-size=150M mount "OneDrive":  ~/OneDrive & disown
