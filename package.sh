#!/bin/sh
# Builds the release archive for gnome-look.org into dist/.
set -eu

NAME=dunes-time-of-day
cd "$(dirname "$0")"
VERSION=$(cat VERSION)
OUT=dist/$NAME-$VERSION.tar.gz

mkdir -p dist
tar --transform "s|^|$NAME/|" -czf "$OUT" \
    backgrounds "$NAME.xml.in" "$NAME-properties.xml.in" \
    install.sh uninstall.sh README.md LICENSE VERSION
echo "$OUT"
