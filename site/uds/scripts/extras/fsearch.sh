#!/bin/bash
set -e
BASENAME='fsearch'
LN='io.github.cboxdoerfer.FSearch'
ICON_OLD='io.github.cboxdoerfer.FSearch'
ICON_NEW='gnome-search-tool'
PPA='christian-boxdoerfer/fsearch-stable'
INSTNAME='fsearch'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
add_ppa
fix_launcher
install_deb