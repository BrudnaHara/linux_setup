#!/bin/bash
option=$(zenity --list --title "Zarządzanie zasilaniem" --column "Opcja" "Zamknij" "Uśpij" "Restart" "Wyloguj")
case "$option" in
  "Zamknij") systemctl poweroff ;;
  "Uśpij") systemctl suspend ;;
  "Restart") systemctl reboot ;;
  "Wyloguj") swaymsg exit ;;
esac