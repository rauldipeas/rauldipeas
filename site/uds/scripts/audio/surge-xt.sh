#!/bin/bash
set -e
#LN=''
#SWMC=''
TARGET="$(wget -qO- https://api.github.com/repos/surge-synthesizer/releases-xt/releases|grep browser_download_url|grep deb|head -n1|cut -d '"' -f4)"
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