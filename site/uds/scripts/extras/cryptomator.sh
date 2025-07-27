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
#DEPS=''
PPA='sebastian-stenzel/cryptomator'
INSTNAME='cryptomator'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
add_ppa
#fix_launcher
install_deb