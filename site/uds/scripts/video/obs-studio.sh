#!/bin/bash
set -e
DEPS='vlc vlc-plugin-jack'
PPA='obsproject/obs-studio'
INSTNAME='obs-studio'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
add_ppa
install_deb