#!/usr/bin/env bash

# Get a list of all .sh files in the directory
scripts=$(find ~/Git/Suckless/dwm/Scripts -type f -name "*.sh")

# Create an associative array with filenames as keys and full paths as values
declare -A script_map
for script in $scripts; do
    script_map[$(basename "$script")]="$script"
done

# Use rofi to prompt the user to select a script
selected_script=$(printf "%s\n" "${!script_map[@]}" | rofi -dmenu -p "Select a script to run:")

# Check if a script was selected
if [ -n "$selected_script" ]; then
    # Run the selected script
    bash "${script_map[$selected_script]}"
else
    echo "No script selected."
fi