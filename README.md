# Linux Setup – Sway + Waybar + Wofi + Foot +

Distro: **Debian 13**  

---

## Paczki
sway swaybg swayidle swaylock waybar wofi wl-clipboard xwayland foot grim slurp pavucontrol libinput-tools wev

---

## Kolorystyka (motyw pastelowy)
- **tło:** `#241B2A`
- **akcent aktywny:** `#d58ab3` (pastelowy róż)
- **akcent nieaktywny:** `#88d8b0` (pastelowa mięta)
- **tekst neutralny:** `#A7A2A8`

---

## Konfiguracje

### Sway (~/.config/sway/config)
```ini
set $term foot
set $menu wofi --show drun

input "SYNA308D:00 06CB:82F5 Touchpad" {
    tap enabled
    natural_scroll enabled
    dwt enabled
    click_method clickfinger
}

client.focused          #241B2A #241B2A #d58ab3 #d58ab3 #d58ab3
client.focused_inactive #241B2A #241B2A #88d8b0 #88d8b0 #241B2A
client.unfocused        #241B2A #241B2A #88d8b0 #88d8b0 #241B2A
client.urgent           #241B2A #241B2A #ff5555 #ff5555 #241B2A

exec waybar

### Waybar  (~/.config/waybar/config)
{
  "layer": "top",
  "position": "top",

  "modules-left": [
    "sway/workspaces",
    "custom/dark-mode"
  ],
  "modules-center": [
    "clock"
  ],
  "modules-right": [
    "custom/brightness",
    "pulseaudio",
    "network",
    "battery"
  ],

  // Jasność - klik otwiera brightness-menu.sh
  "custom/brightness": {
    "format": "☀️ {}%",
    "tooltip": true,
    "on-click": "~/.config/waybar/scripts/brightness-menu.sh",
    "exec": "brightnessctl get | awk '{ printf \"%.0f\", $1/255*100 }'",
    "interval": 5
  },

  // Tryb ciemny/jasny - klik przełącza (już jest OK)
  "custom/dark-mode": {
    "format": "{}",
    "tooltip": true,
    "on-click": "~/.config/waybar/scripts/toggle-dark-mode.sh",
    "exec": "~/.config/waybar/scripts/get-dark-mode.sh",
    "interval": 10
  },

  // Zegar - klik otwiera kalendarz (gnome-calendar)
  "clock": {
    "format": "{:%Y-%m-%d %H:%M:%S}",
    "tooltip": true,
    "on-click": "gnome-calendar"
  },

  // Audio - klik otwiera pavucontrol (OK)
  "pulseaudio": {
    "format": "{volume}% 🔊",
    "format-muted": "MUTE 🔇",
    "tooltip": true,
    "on-click": "pavucontrol"
  },

  // Sieć - klik otwiera nm-connection-editor
  "network": {
    "format-wifi": "WiFi: {essid} ({signalStrength}%)",
    "format-ethernet": "LAN: {ifname}",
    "format-disconnected": "Disconnected ❌",
    "tooltip": true,
    "on-click": "nmtui"
  },

  // Bateria - klik otwiera menu zasilania (textowe)
  "battery": {
    "format": "{capacity}% {icon}",
    "format-icons": ["🪫", "🔋", "🔋", "🔋", "🔋"],
    "tooltip": true,
    "on-click": "~/.config/waybar/scripts/power-menu.sh"
  }
}

### Wofi (~/.config/wofi/config)
drun-path=/usr/share/applications:/home/brudna_hara/.local/share/applications

### Foot (~/.config/foot/foot.ini)
[colors]
foreground=a7a2a8
background=241b2a

### Kolory terminala (Micro) (~/.config/micro/settings.json)
{
  "softwrap": true,
  "tabstospaces": true,
  "tabsize": 4,
  "colorscheme": "pastelini"
}


### Bash prompt (~/.bashrc)
PS1='`if [[ -n "$VIRTUAL_ENV" ]]; then echo -e "\[\e[1;31m\]($(basename $VIRTUAL_ENV)) \[\e[0m\]"; fi`\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;33m\]\w\[\e[0m\]\$ '

### Przykłady .desktop
[Desktop Entry]
Name=Discord
Exec=discord
Icon=discord
Type=Application
Categories=Network;Chat;

Telegram
[Desktop Entry]
Name=Telegram
Exec=telegram-desktop
Icon=telegram
Type=Application
Categories=Network;Chat;

WhatsApp
[Desktop Entry]
Name=WhatsApp
Exec=whatsapp-for-linux
Icon=whatsapp
Type=Application
Categories=Network;Chat;

### przykład .desktop dla Firefoksa z oddzielnym profilem (np. GPT5):
[Desktop Entry]
Name=Firefox GPT5
Comment=Firefox ESR z profilem GPT5, izolowany
Exec=firefox-esr --no-remote --new-instance -P GPT5 https://chat.openai.com
Icon=firefox
Type=Application
Categories=Network;WebBrowser;
Terminal=false
StartupWMClass=FirefoxGPT5

    --no-remote → uniemożliwia współdzielenie instancji,

    --new-instance → wymusza nowy proces,

    -P GPT5 → używa profilu GPT5,

    StartupWMClass → pozwala Waylandowi/Sway odróżnić okna i przypiąć je np. do workspace.


Repozytorium

GitHub: BrudnaHara/linux_setup

Zawartość:

sway/

waybar/

wofi/

foot/

desktop-files/

sway/manifest.yaml

