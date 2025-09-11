#!/usr/bin/env bash
set -euo pipefail

pick() { wofi --dmenu -p "$1"; }

case "$(printf '%s\n' '🔊 vol +5%' '🔉 vol -5%' '🔇 mute' '🎙 mic mute' '🟦 BT: connect paired' '🟦 BT: scan/pair/connect' | pick 'Audio:')" in
  '🔊 vol +5%') pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
  '🔉 vol -5%') pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
  '🔇 mute')    pactl set-sink-mute   @DEFAULT_SINK@ toggle ;;
  '🎙 mic mute') pactl set-source-mute @DEFAULT_SOURCE@ toggle ;;

  '🟦 BT: connect paired')
    sel="$(bluetoothctl devices Paired | sed 's/^Device //')" || true
    [ -z "${sel}" ] && exit 0
    line="$(printf '%s\n' "$sel" | pick 'Paired:')" || exit 0
    mac="${line%% *}"
    bluetoothctl connect "$mac" >/dev/null 2>&1 || true
    ;;

  '🟦 BT: scan/pair/connect')
    bluetoothctl --timeout 8 scan on >/dev/null 2>&1 || true
    list="$(bluetoothctl devices | sed 's/^Device //')" || true
    [ -z "${list}" ] && exit 0
    line="$(printf '%s\n' "$list" | pick 'Devices:')" || exit 0
    mac="${line%% *}"
    bluetoothctl pair   "$mac" >/dev/null 2>&1 || true
    bluetoothctl trust  "$mac" >/dev/null 2>&1 || true
    bluetoothctl connect"$mac" >/dev/null 2>&1 || true
    ;;
esac
