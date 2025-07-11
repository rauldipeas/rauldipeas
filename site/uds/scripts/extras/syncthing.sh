#!/bin/bash
set -e
LN='syncthingtray'
#SWMC=''
#TARGET="$()"
EXEC_OLD='syncthingtray'
EXEC_NEW='env QT_QPA_PLATFORM=xcb syncthingtray'
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='syncthingtray'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh(#enter_tmp
#download
fix_launcher
install_deb