#!/bin/bash
set -e
BASENAME='keepassxc'
LN='org.keepassxc.KeePassXC'
#SWMC=''
#TARGET="$()"
EXEC_OLD='keepassxc'
EXEC_NEW='env QT_QPA_PLATFORM=xcb keepassxc'
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='keepassxc'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
fix_launcher
install_deb