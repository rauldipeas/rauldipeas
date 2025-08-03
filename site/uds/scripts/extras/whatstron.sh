#!/bin/bash
set -e
BASENAME='whatstron'
LN='whatstron'
#SWMC=''
TARGET="$(wget -qO- https://api.github.com/repos/murilopereirame/Whatstron/releases|grep browser_download_url|grep download|grep deb|head -n1|cut -d '"' -f4)"
#EXEC_OLD=''
#EXEC_NEW=''
ICON_OLD='whatstron'
ICON_NEW='whatsapp'
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
install_deb