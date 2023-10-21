#!/bin/sh
# start foot --server
# ----------------------------------------------------- 
# Quit running waybar instances
# ----------------------------------------------------- 
killall foot

sleep 2

# ----------------------------------------------------- 
# Loading the configuration based on the username
# ----------------------------------------------------- 
foot --server &
