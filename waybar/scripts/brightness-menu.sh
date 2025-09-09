#!/bin/bash
# Skrypt otwiera menu z suwakiem jasności (obsługiwane klawiaturą)
brightness=$(brightnessctl get | awk '{ printf "%.0f", $1/255*100 }')
new_brightness=$(zenity --scale --title "Jasność ekranu" --text "Ustaw jasność:" --min-value 0 --max-value 100 --value $brightness --step 5)
if [ -n "$new_brightness" ]; then
  brightnessctl set "$new_brightness%"
fi