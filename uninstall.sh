#!/bin/sh
# Removes the time-of-day wallpaper again.
set -eu

NAME=dunes-time-of-day
DATA=${XDG_DATA_HOME:-$HOME/.local/share}

rm -rf "$DATA/backgrounds/$NAME"
rm -f "$DATA/gnome-background-properties/$NAME.xml"
echo "Removed. If it was still active, pick another background under Settings → Appearance."
