#!/bin/bash
set -e
BASENAME="gimp"
LN='org.gimp.GIMP.Stable'
#SWMC=''
GIMP_VER="$(wget -qO- https://www.gimp.org/downloads|grep 'stable'|head -n1|cut -d '>' -f3|cut -d '<' -f1)"
TARGET="https://download.gimp.org/gimp/v3.0/linux/GIMP-$GIMP_VER-x86_64.AppImage"
EXEC_OLD='org.gimp.GIMP.Stable'
EXEC_NEW='gimp'
ICON_OLD='org.gimp.GIMP.Stable'
ICON_NEW='gimp'
DEPS="libcanberra-gtk-module\
	gtk2-engines-murrine\
	gtk2-engines-pixbuf"
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#fix_launcher
install_deb
mkdir -p "$HOME"/.config/GIMP/3.0
wget -q --show-progress -O "$HOME"/.config/GIMP/3.0/gimprc https://rauldipeas.com.br/uds/settings/gimprc
wget -q --show-progress -O "$HOME"/.config/GIMP/3.0/sessionrc https://rauldipeas.com.br/uds/settings/sessionrc
enter_tmp
download
install_appimage