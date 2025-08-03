#!/bin/bash
set -e
#BASENAME=''
#LN=''
#SWMC=''
TARGET="$(wget -qO- https://rclone.org/downloads|grep amd64.deb|head -n1|cut -d '"' -f4)"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
DEPS='rclone-browser'
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
#fix_launcher
install_deb