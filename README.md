# Linux Setup – Debian 13 + Sway

Minimalny setup oparty na **Debian 13** i menedżerze okien **Sway**.  
Celem było pozbycie się ciężkich środowisk (GNOME) i skonfigurowanie lekkiego, ręcznie sterowanego systemu.  

---

## Komponenty

- **Sway** – główny window manager  
- **Waybar** – panel statusu z własnymi modułami  
- **Wofi** – launcher i menu wyboru (także jako `--dmenu` w skryptach)  
- **Foot** – terminal  
- **Micro** – lekki edytor tekstu  
- **Pakiety dodatkowe** – grim, slurp, pavucontrol, wl-clipboard, libinput-tools, wev  

---

## Struktura repo
sway/ → konfiguracja Sway + manifest.yaml
waybar/ → config.jsonc, style.css, skrypty (jasność, audio, wifi, zasilanie)
wofi/ → config + style.css
foot/ → foot.ini (kolory terminala)
desktop-files/ → własne launchery .desktop (Firefox profiles, Discord, Telegram, WhatsApp)


---

## Najważniejsze ustawienia

- **Autologowanie**: po usunięciu GNOME/GDM system startuje w trybie tekstowym (tty1).  
  W `~/.profile` jest blok:  
  ```bash
  if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
      exec sway
  fi
→ logowanie na tty1 automatycznie uruchamia Sway.

Waybar:

[br] = jasność (skrypt brightness-menu.sh)

[vol] = głośność (skrypt audio-menu.sh)

[net] = sieć WiFi/Ethernet (skrypt wifi-menu.sh)

[bat] = bateria (skrypt power-menu.sh)

Wofi:

działa jako launcher (wofi --show drun)

używany w trybie --dmenu w skryptach Waybara

ma własny style.css

Foot: pastelowy kolor motywu (foreground #a7a2a8, background #241b2a)

Manifest

Szczegółowy opis wszystkich paczek i konfiguracji → sway/manifest.yaml

Repozytorium

GitHub: BrudnaHara/linux_setup

Cel projektu

Użyteczny, minimalistyczny desktop na Debianie 13

Dokumentacja procesu dla osób chcących przejść z ciężkich środowisk na Sway

Publiczny przykład pełnego setupu (configi + manifest)