#!/bin/bash
set -x

# Directory containing theme files
THEME_DIR="/home/thegassyninja/Git/Suckless/dwm/Themes"
CONFIG_DIR="/home/thegassyninja/Git/Suckless/dwm/config.h"

# Get a list of all .h files in the theme directory
THEMES=$(find $THEME_DIR -type f -name "*.h")

# Use rofi to prompt the user to select a theme
CHOSEN_THEME=$(echo "$THEMES" | rofi -dmenu -p "Select a theme")

# If a theme was chosen
if [ -n "$CHOSEN_THEME" ]; then
    

# Use sed to replace the include line in config.h
sed -i "s|^#include \".*\"|#include \"$CHOSEN_THEME\"|" "$CONFIG_DIR"
    cd /home/thegassyninja/Git/Suckless/dwm
    make
    sudo make install
    
    echo "Theme changed!
else
    echo "No theme selected"
fi