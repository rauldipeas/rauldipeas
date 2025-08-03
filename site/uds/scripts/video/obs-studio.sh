#!/bin/bash
set -e
#BASENAME=''
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD='obs'
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
DEPS='vlc vlc-plugin-jack'
PPA='obsproject/obs-studio'
INSTNAME='obs-studio'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
#fix_launcher
add_ppa
install_deb