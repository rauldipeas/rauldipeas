#!/bin/bash
set -e
BASENAME='freedownloadmanager'
LN='freedownloadmanager'
SWMC='fdm'
TARGET="$(curl -s https://www.freedownloadmanager.org/pt/download-fdm-for-linux.htm|grep deb|head -n1|cut -d '"' -f4)"
ICON_OLD='/opt/freedownloadmanager/icon.png'
ICON_NEW='freedownloadmanager'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
install_deb
mkdir -p "$HOME"/.local/share/icons
cp /opt/freedownloadmanager/icon.png "$HOME"/.local/share/icons/freedownloadmanager.png