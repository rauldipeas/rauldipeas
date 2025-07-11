#!/bin/bash
set -e
#LN=''
#SWMC=''
TARGET="$(wget -qO- https://peazip.github.io/peazip-linux.html|grep GTK|grep deb|cut -d '"' -f2)"
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