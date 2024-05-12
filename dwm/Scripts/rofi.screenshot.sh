#!/bin/bash

# Check if the directory ~/Screenshots exists, if not, create it
if [ ! -d ~/Screenshots ]; then
    mkdir ~/Screenshots
fi

# Define the options for the screenshot menu
options="Full Screen\nSelect Area\nActive Window"

# Prompt the user to select an option using rofi
selected_option=$(echo -e $options | rofi -dmenu -p "Select Screenshot Option:")

# Take the screenshot based on the selected option
case $selected_option in
    "Full Screen")
        scrot -d 1 '%Y-%m-%d-%H%M%S.png' -e 'mv $f ~/Screenshots/'
        ;;
    "Select Area")
        scrot -s -d 1 '%Y-%m-%d-%H%M%S.png' -e 'mv $f ~/Screenshots/'
        ;;
    "Active Window")
        scrot -u -d 1 '%Y-%m-%d-%H%M%S.png' -e 'mv $f ~/Screenshots/'
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
