#!/bin/bash
current_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [[ "$current_theme" == *"Dark"* ]]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    echo "🌞"
else
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
    echo "🌙"
fi