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
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh
enter_tmp
#download
wget -qO- https://chowdsp.com/products.html|grep deb|grep -v ChowCentaur|grep -v ChowPhaser|cut -d '"' -f2|xargs wget -q --show-progress
#fix_launcher
install_deb