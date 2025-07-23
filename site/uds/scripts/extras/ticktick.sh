#!/bin/bash
set -e
BASENAME=''
LN=''
SWMC=''
TICKTICK_VERSION="$(wget -qO- https://snapcraft.io/ticktick|grep stable|grep version|cut -d '"' -f 28)"
TARGET="https://d2atcrkye2ik4e.cloudfront.net/download/linux/linux_deb_x64/ticktick-"$TICKTICK_VERSION"-amd64.deb"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
#fix_launcher
install_deb