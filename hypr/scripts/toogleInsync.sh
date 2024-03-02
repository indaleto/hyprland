#!/bin/sh
#  _   _           _       _             
# | | | |_ __   __| | __ _| |_ ___  ___  
# | | | | '_ \ / _` |/ _` | __/ _ \/ __| 
# | |_| | |_) | (_| | (_| | ||  __/\__ \ 
#  \___/| .__/ \__,_|\__,_|\__\___||___/ 
#       |_|                              
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 
# Requires pacman-contrib trizen

# ----------------------------------------------------- 
# Calculate cpu usage
# ----------------------------------------------------- 

status=$(insync status)
file="/tmp/insync.status"

# ----------------------------------------------------- 
# Output in JSON format for Waybar Module custom-updates
# ----------------------------------------------------- 

if [ "$status" == "Insync doesn't seem to be running. Start it first." ]; then
    insync start
else
    if test -f "$file"; then
        insync hide
        rm $file
    else
        insync show
        touch $file
    fi
fi