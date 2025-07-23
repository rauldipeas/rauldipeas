#!/bin/bash
set -e
BASENAME='inkscape'
LN='org.inkscape.Inkscape'
#SWMC=''
#TARGET="$()"
EXEC_OLD='inkscape'
EXEC_NEW='sh -c "env GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme) inkscape"'
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='inkscape'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
fix_launcher
install_deb