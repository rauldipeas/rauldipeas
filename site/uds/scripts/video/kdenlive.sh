#!/bin/bash
set -e
BASENAME='kdenlive'
LN='org.kde.kdenlive'
SWMC='org.kde.kdenlive'
KDENLIVE_VER="$(wget -qO- https://download.kde.org/stable/kdenlive|grep folder|cut -d '"' -f4|cut -d '/' -f1)"
KDENLIVE_FILE="$(wget -qO- https://download.kde.org/stable/kdenlive/"$KDENLIVE_VER"/linux|grep AppImage|tail -n1|cut -d '"' -f4)"
TARGET="https://download.kde.org/stable/kdenlive/$KDENLIVE_VER/linux/$KDENLIVE_FILE"
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
install_appimage
sudo rm -f /usr/local/bin/kdenlive
printf 'cd /opt/kdenlive&&/opt/kdenlive/AppRun'|sudo tee /usr/local/bin/kdenlive>/dev/null
sudo chmod +x /usr/local/bin/kdenlive