#!/bin/bash
set -e
DEPS='vlc vlc-plugin-jack'
PPA='obsproject/obs-studio'
INSTNAME='obs-studio'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
add_ppa
install_deb
for type in $(grep -E '^(audio|video)/' /usr/share/mime/types | cut -d: -f1); do
    xdg-mime default vlc.desktop "$type"
done