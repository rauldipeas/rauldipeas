#!/bin/bash
set -e
BASENAME='fsearch'
LN='io.github.cboxdoerfer.FSearch'
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
ICON_OLD='io.github.cboxdoerfer.FSearch'
ICON_NEW='gnome-search-tool'
#DEPS=''
PPA='christian-boxdoerfer/fsearch-stable'
INSTNAME='fsearch'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
add_ppa
fix_launcher
install_deb