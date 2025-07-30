#!/bin/bash
set -e
#BASENAME=''
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
DEPS='thunderbird-locale-pt-br'
PPA='mozillateam/ppa'
INSTNAME='thunderbird-gnome-support'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
add_ppa
cat <<EOF |sudo tee /etc/apt/preferences.d/thunderbird
Package: thunderbird*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
EOF
#fix_launcher
install_deb