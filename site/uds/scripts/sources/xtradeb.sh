#!/bin/bash
set -e
#LN=''
#SWMC=''
TARGET="$(wget -qO- https://xtradeb.net/wiki/how-to-install-applications-from-this-web-site|grep Noble|grep deb|cut -d '"' -f2)"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh(enter_tmp
download
#fix_launcher
install_deb