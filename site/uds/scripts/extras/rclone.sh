#!/bin/bash
set -e
LN='rclone-browser'
#SWMC=''
TARGET="$(wget -qO- https://rclone.org/downloads|grep amd64.deb|head -n1|cut -d '"' -f4)"
EXEC_OLD='rclone-browser'
EXEC_NEW='env QT_QPA_PLATFORM=xcb rclone-browser'
#ICON_OLD=''
#ICON_NEW=''
DEPS='rclone-browser'
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh(enter_tmp
download
fix_launcher
install_deb