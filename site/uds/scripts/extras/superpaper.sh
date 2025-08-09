#!/bin/bash
set -e
w#LN=''
DEPS='python3-wxgtk4.0'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
install_deb
pipx install --force superpaper --system-site-packages
mkdir -p "$HOME"/.local/share/icons
cp "$HOME"/.local/share/pipx/venvs/superpaper/share/icons/hicolor/256x256/apps/superpaper.png "$HOME"/.local/share/icons/
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