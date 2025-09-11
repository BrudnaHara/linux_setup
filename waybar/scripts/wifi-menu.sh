#!/usr/bin/env bash
set -euo pipefail

# wybór SSID w Wofi
SSID="$(nmcli -t -f SSID dev wifi list | grep -v '^$' | sort -u | wofi --dmenu -p 'WiFi:')"
[ -z "${SSID:-}" ] && exit 0

# jeśli masz już zapisany profil, wstań połączenie
if nmcli -t -f NAME connection show | grep -Fxq "$SSID"; then
  nmcli connection up "$SSID"
  exit 0
fi

# jeśli nie masz profilu, zapytaj o hasło i połącz
PASS="$(wofi --dmenu -p "Hasło do $SSID:")"
[ -z "${PASS:-}" ] && exit 0
nmcli dev wifi connect "$SSID" password "$PASS"
