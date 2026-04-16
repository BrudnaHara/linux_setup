#!/usr/bin/env bash
set -euo pipefail

pick() { wofi --dmenu -p "$1"; }
prompt() { wofi --dmenu --allow-input --prompt "$1"; }

# Pobierz aktualną jasność (0‑100)
current=$(brightnessctl get | awk '{ printf "%.0f", $1/255*100 }')

# Poproś o nową wartość przez wofi (pole tekstowe)
new_brightness=$(printf '%s' "$current" | prompt "☀️ Jasność (%)")

# Jeśli użytkownik podał wartość, ustaw jasność
if [ -n "$new_brightness" ]; then
    brightnessctl set "${new_brightness}%"
fi
