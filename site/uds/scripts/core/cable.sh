#!/bin/bash
set -e
BASENAME='cable'
LN='com.github.magillos.cable'
#SWMC=''
TARGET="$(wget -qO- https://api.github.com/repos/magillos/Cable/releases|grep browser_download_url|grep deb|head -n1|cut -d '"' -f4)"
EXEC_OLD='pw-jack cable'
EXEC_NEW='env QT_QPA_PLATFORM=xcb pw-jack cable'
ICON_OLD='jack-plug'
ICON_NEW='laditools'
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
install_deb
sudo cp /usr/share/icons/Papirus/22x22/panel/ladi-starting.svg /usr/bin/jack-plug.svg