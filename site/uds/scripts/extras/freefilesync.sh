#!/bin/bash
set -e
LN='FreeFileSync'
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
ICON_OLD='FreeFileSync'
ICON_NEW='freefilesync'
#DEPS=''
#PPA=''
INSTNAME='freefilesync'
BASENAME2='realtimesync'
LN2='RealTimeSync'
ICON_OLD2='RealTimeSync'
ICON_NEW2='realtimesync'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh
#enter_tmp
#download
fix_launcher
install_deb