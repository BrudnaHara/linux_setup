#!/usr/bin/env bash
set -euo pipefail

choice="$(printf '%s\n' lock logout suspend hibernate reboot poweroff | wofi --dmenu -p 'Zasilanie:')"
[ -z "${choice:-}" ] && exit 0

case "$choice" in
  lock)      command -v swaylock >/dev/null && swaylock || : ;;
  logout)    swaymsg exit ;;
  suspend)   systemctl suspend ;;
  hibernate) systemctl hibernate ;;
  reboot)    systemctl reboot ;;
  poweroff)  systemctl poweroff ;;
esac
