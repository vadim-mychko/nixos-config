#!/usr/bin/env bash

# Array of color names
color_names=(
    "Black" "Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "White" "Bright Black"
    "Bright Red" "Bright Green" "Bright Yellow" "Bright Blue" "Bright Magenta"
    "Bright Cyan" "Bright White" "Extended 16" "Extended 17"
)

for i in {0..17}; do
    if [ $i -lt 10 ]; then
        index=" $i"  # Add a leading space for single-digit numbers
    else
        index=$i
    fi
    tput setaf $i
    echo "Color $index (${color_names[$i]})"
done

# Reset the text color to default
tput sgr0
