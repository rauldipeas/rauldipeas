#!/bin/bash
set -e
BASENAME='gisto'
LN='Gisto'
TARGET="$(wget -qO- https://api.github.com/repos/Gisto/Gisto/releases|grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"
ICON_OLD='Gisto'
ICON_NEW='gisto'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
install_deb