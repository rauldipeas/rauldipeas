#!/bin/bash
set -e
LN='com.obsproject.Studio'
#SWMC=''
#TARGET="$()"
EXEC_OLD='obs'
EXEC_NEW='env QT_QPA_PLATFORM=xcb obs'
#ICON_OLD=''
#ICON_NEW=''
DEPS='vlc vlc-plugin-jack'
PPA='obsproject/obs-studio'
INSTNAME='obs-studio'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
fix_launcher
add_ppa
install_deb