#!/bin/bash
set -e
#LN=''
#SWMC=''
TARGET="$(wget -qO- https://api.github.com/repos/NatronGitHub/Natron/releases|grep browser_download_url|grep download|grep no-installer.tar.xz|head -n1|cut -d '"' -f4)"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh
enter_tmp
download
#fix_launcher
#install_deb
tar xf Natron*.tar.xz
rm Natron*.tar.xz
mv Natron* "$HOME"/.local/share/natron
cat <<EOF |tee "$HOME"/.local/share/applications/natron.desktop>/dev/null
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name=Natron 2
MimeType=application/x-natron
Exec="$HOME"/.local/share/natron/Natron %U
GenericName=Compositing software
Comment=Node-graph based compositing software
Categories=Graphics;2DGraphics;RasterGraphics;
Icon=natron
StartupNotify=true
EOF