#!/bin/bash
set -e
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
DEPS='python3-wxgtk4.0'
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh(#enter_tmp
#download
#fix_launcher
install_deb
pipx install --force superpaper --system-site-packages
cat <<EOF |tee "$HOME"/.local/share/applications/superpaper.desktop>/dev/null
[Desktop Entry]
Type=Application
Version=1.0
Name=Superpaper
GenericName=Multi-monitor wallpaper manager
Exec=env GDK_BACKEND=x11 /home/$USER/.local/bin/superpaper
Icon=superpaper
Terminal=false
Categories=Utility; 
X-KDE-autostart-after=panel
EOF
mkdir -p "$HOME"/.config/autostart
ln -sf "$HOME"/.local/share/applications/superpaper.desktop "$HOME"/.config/autostart/