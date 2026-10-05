#!/bin/sh
# Installs the time-of-day wallpaper for the current user.
#   ./install.sh          install only
#   ./install.sh --set    install and set it as the background right away
set -eu

NAME=dunes-time-of-day
SRC=$(cd "$(dirname "$0")" && pwd)
DATA=${XDG_DATA_HOME:-$HOME/.local/share}
DIR=$DATA/backgrounds/$NAME
PROPS=$DATA/gnome-background-properties

mkdir -p "$DIR" "$PROPS"
cp "$SRC"/backgrounds/*.jpg "$DIR"/
sed "s|@DIR@|$DIR|g" "$SRC/$NAME.xml.in" > "$DIR/$NAME.xml"
sed "s|@DIR@|$DIR|g" "$SRC/$NAME-properties.xml.in" > "$PROPS/$NAME.xml"
echo "Installed to $DIR"

if [ "${1:-}" = "--set" ]; then
    gsettings set org.gnome.desktop.background picture-uri "file://$DIR/$NAME.xml"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$DIR/$NAME.xml"
    gsettings set org.gnome.desktop.background picture-options zoom
    echo "Set as background"
else
    echo "Pick it under Settings → Appearance → Background, or run again with --set"
fi
