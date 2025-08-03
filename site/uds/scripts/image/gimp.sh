#!/bin/bash
set -e
#BASENAME=''
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
DEPS="libcanberra-gtk-module\
	gtk2-engines-murrine\
	gtk2-engines-pixbuf"
PPA='ubuntuhandbook1/gimp-3'
INSTNAME='gimp'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#fix_launcher
#enter_tmp
#download
add_ppa
install_deb
mkdir -p "$HOME"/.config/GIMP/3.0
wget -q --show-progress -O "$HOME"/.config/GIMP/3.0/gimprc https://rauldipeas.com.br/uds/settings/gimprc
wget -q --show-progress -O "$HOME"/.config/GIMP/3.0/sessionrc https://rauldipeas.com.br/uds/settings/sessionrc