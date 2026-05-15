#!/bin/bash
WALLPAPERS_DIR="$HOME/.config/hypr/wallpaper-mp4/"

CURRENT_WALL=$(pgrep -a mpvpaper | grep -oP '(?<=\.mp4 ).*\.mp4' | head -1)

RANDOM_WALL=$(find "$WALLPAPERS_DIR" -type f -iname '*.mp4' ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

if [ -z "$RANDOM_WALL" ]; then
    echo "❌ No se encontraron MP4 en: $WALLPAPERS_DIR"
    exit 1
fi

# Matar instancia anterior
pkill mpvpaper

sleep 0.5

# Aplicar en ambos monitores
# mpvpaper -o "loop" HDMI-A-1 "$RANDOM_WALL" &
mpvpaper -o "loop" HDMI-A-2 "$RANDOM_WALL" &

echo "✅ Wallpaper aplicado: $RANDOM_WALL"
