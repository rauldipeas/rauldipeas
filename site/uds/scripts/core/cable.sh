#!/bin/bash
set -e
BASENAME='cable'
LN='com.github.magillos.cable'
TARGET="$(wget -qO- https://api.github.com/repos/magillos/Cable/releases|grep browser_download_url|grep deb|head -n1|cut -d '"' -f4)"
ICON_OLD='jack-plug'
ICON_NEW='laditools'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
install_deb
mkdir -p "$HOME"/.config/{autostart,cable}
cat <<EOF |tee "$HOME"/.config/cable/config.ini>/dev/null
[DEFAULT]
tray_enabled = True
autostart_enabled = True
EOF