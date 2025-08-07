#!/bin/bash
set -e
INSTNAME='q4wine'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
sudo dpkg --add-architecture i386
sudo apt update
install_deb
if command -v q4wine>/dev/null;then
	xdg-mime default q4wine.desktop application/x-ms-dos-executable
	xdg-mime default q4wine.desktop application/x-msi
fi
if [ $XDG_CURRENT_DESKTOP == ubuntu:GNOME ];then
	sudo apt install -y --reinstall qt5-gtk2-platformtheme qt5ct
	cat <<EOF |sudo tee /etc/profile.d/qt-qpa.sh>/dev/null
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORMTHEME=qt5ct
EOF
	mkdir -p "$HOME"/.config/qt5ct
	cat <<EOF |tee "$HOME"/.config/qt5ct/qt5ct.conf>/dev/null
[Appearance]
icon_theme=Papirus-Dark
style=gtk2

[Fonts]
fixed=@Variant(\0\0\0@\0\0\0\x16\0U\0\x62\0u\0n\0t\0u\0 \0S\0\x61\0n\0s@&\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x19\x10)
general=@Variant(\0\0\0@\0\0\0\x16\0U\0\x62\0u\0n\0t\0u\0 \0S\0\x61\0n\0s@&\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x19\x10)
EOF
fi