#!/bin/bash
set -e
BASENAME='shutter-encoder'
LN='Shutter_Encoder'
SWMC='application-Shutter'
versao=$(curl -s 'https://www.shutterencoder.com/old%20versions/Linux/'|grep -Po 'Shutter Encoder \K[0-9]+\.[0-9]+'|sort -V | tail -1)
IFS=. read -r major minor <<< "$versao"
minor=$((minor + 1))
TARGET="https://www.shutterencoder.com/Shutter%20Encoder%20${major}.${minor}%20Linux%2064bits.deb"
ICON_OLD='/usr/lib/Shutter\ Encoder/usr/bin/icon.png'
ICON_NEW='shutter-encoder'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
mv /tmp/Shutter*.deb /tmp/shutter-encoder.deb
install_deb
mkdir -p "$HOME"/.local/share/icons
ln -sf /usr/lib/Shutter\ Encoder/usr/bin/icon.png "$HOME"/.local/share/icons/shutter-encoder.png