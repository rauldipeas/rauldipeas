#!/bin/bash
set -e
TARGET="$(wget -qO- 'https://www.retroarch.com/?page=platforms'|grep AppImage|grep RetroArch.7z|cut -d '"' -f2)"
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
7za x -y -bsp0 RetroArch.7z>/dev/null
mkdir -p "$HOME"/.local/share/{icons,retroarch}
mv /tmp/RetroArch-Linux-x86_64/RetroArch-Linux-x86_64.AppImage* "$HOME"/.local/share/retroarch/
ln -fs "$HOME"/.local/share/retroarch/RetroArch-Linux-x86_64.AppImage "$HOME"/.local/bin/retroarch
wget -q --show-progress -O "$HOME"/.local/share/icons/retroarch.svg https://upload.wikimedia.org/wikipedia/commons/3/3b/Retroarch.svg
cat <<EOF |tee "$HOME"/.local/share/applications/retroarch.desktop>/dev/null
[Desktop Entry]
Version=1.0
Name=RetroArch
GenericName=Frontend for the libretro API
Type=Application
Comment=Frontend for emulators, game engines and media players
Comment[ru]=Графический интерфейс для эмуляторов, игровых движков и медиаплееров
Comment[fr]=Interface graphique pour émulateurs, moteurs de jeu et lecteurs multimédia
Comment[de]=Front-End für Emulatoren, Spiel-Engines und Mediaplayer
Icon=retroarch
Exec=retroarch
Terminal=false
StartupNotify=false
StartupWMClass=retroarch
Keywords=multi;engine;emulator;xmb;
Categories=Game;Emulator;
EOF