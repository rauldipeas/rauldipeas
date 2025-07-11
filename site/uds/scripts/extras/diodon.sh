#!/bin/bash
set -e
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='diodon'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh
#enter_tmp
#download
#fix_launcher
install_deb
gsettings set net.launchpad.Diodon.clipboard add-images true