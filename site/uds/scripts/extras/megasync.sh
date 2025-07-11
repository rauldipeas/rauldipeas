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
MEGASYNCVERSION="xUbuntu_24.04"
wget -q --show-progress https://mega.nz/linux/repo/"$MEGASYNCVERSION"/amd64/megasync-"$MEGASYNCVERSION"_amd64.deb
wget -q --show-progress https://mega.nz/linux/repo/"$MEGASYNCVERSION"/amd64/nautilus-megasync-"$MEGASYNCVERSION"_amd64.deb
#fix_launcher
install_deb
#LANGUAGE=en pacstall -IP megasync-deb