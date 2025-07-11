#!/bin/bash
set -e
LN='q4wine'
#SWMC=''
#TARGET="$()"
EXEC_OLD='q4wine'
EXEC_NEW='env QT_QPA_PLATFORM=xcb q4wine'
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='q4wine'
BASENAME2='qt5ct'
LN2='qt5ct'
EXEC_OLD2='qt5ct'
EXEC_NEW2='env QT_QPA_PLATFORM=xcb qt5ct'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh
#enter_tmp
#download
fix_launcher
sudo dpkg --add-architecture i386
sudo apt update
install_deb
if command -v q4wine>/dev/null;then
	xdg-mime default q4wine.desktop application/x-ms-dos-executable
	xdg-mime default q4wine.desktop application/x-msi
fi
if [ $XDG_CURRENT_DESKTOP == ubuntu:GNOME ];then
	sudo apt install -y qt5-gtk2-platformtheme qt5ct
	printf 'export QT_QPA_PLATFORMTHEME=qt5ct'|sudo tee /etc/profile.d/qt-qpa-platformtheme.sh>/dev/null
	mkdir -p "$HOME"/.config/qt5ct
	cat <<EOF |tee "$HOME"/.config/qt5ct/qt5ct.conf>/dev/null
[Appearance]
icon_theme=Papirus-Dark
style=gtk2
EOF
fi