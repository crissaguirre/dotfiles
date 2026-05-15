#!/bin/bash

# Carpeta de wallpapers
WALLPAPERS_DIR="$HOME/.config/hypr/wallpaper/"

for i in {1..10}; do
    if [ -S /run/user/1000/hypr/.hyprpaper.sock ]; then
        break
    fi
    sleep 1
done

CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Escoge una imagen aleatoria
# RANDOM_WALL=$(find "$WALLPAPERS_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)
RANDOM_WALL=$(find "$WALLPAPERS_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Aplica en ambos monitores
# hyprctl hyprpaper preload "$RANDOM_WALL"
# hyprctl hyprpaper wallpaper "HDMI-A-1,$RANDOM_WALL"
# hyprctl hyprpaper wallpaper "HDMO-A-2,$RANDOM_WALL"

hyprctl hyprpaper wallpaper "HDMI-A-1","$RANDOM_WALL"
# hyprctl hyprpaper wallpaper "HDMI-A-2","$RANDOM_WALL"

# Opcional: mostrar cuál se eligió
echo "Wallpaper aplicado: $RANDOM_WALL"
