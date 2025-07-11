#!/bin/bash
set -e
LN='tenacity'
#SWMC=''
TARGET="$(wget -qO- https://codeberg.org/tenacityteam/tenacity/releases|grep AppImage|grep linux-v|grep -v asc|grep -v gpg|head -n2|tail -n1|cut -d '"' -f8)"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh
enter_tmp
download
#fix_launcher
install_appimage
sudo rm -f /usr/local/bin/tenacity
printf 'cd /opt/tenacity&&/opt/tenacity/AppRun'|sudo tee /usr/local/bin/tenacity>/dev/null
sudo chmod +x /usr/local/bin/tenacity