#!/bin/bash
current_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [[ "$current_theme" == *"Dark"* ]]; then
    echo "🌙"
else
    echo "🌞"
fi
