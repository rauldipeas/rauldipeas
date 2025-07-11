#!/bin/bash
set -e
LN='freedownloadmanager'
SWMC='fdm'
TARGET="$(wget -qO- https://www.freedownloadmanager.org/pt/download-fdm-for-linux.htm|grep deb|head -n1|cut -d '"' -f4)"
#EXEC_OLD=''
#EXEC_NEW=''
ICON_OLD='/opt/freedownloadmanager/icon.png'
ICON_NEW='freedownloadmanager'
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh
enter_tmp
download
fix_launcher
install_deb