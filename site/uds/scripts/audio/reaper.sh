#!/bin/bash
set -e
pacstall -IP ffmpeg4.4
sudo apt autoremove --purge -y
am -i --icons reaper
wget -q --show-progress -O- https://stash.reaper.fm/41334/libSwell.colortheme|sed 's/Open Sans/Segoe UI Symbol/'|sudo tee /opt/reaper/libSwell.colortheme>/dev/null
mkdir -p "$HOME"/.config/REAPER/{LangPack,UserPlugins}
wget -q --show-progress -O "$HOME"/.config/REAPER/LangPack/pt-BR.ReaperLangPack https://stash.reaper.fm"$(wget -qO- https://stash.reaper.fm/tag/Language-Packs|grep pt-BR|head -n1|cut -d '"' -f2|sed 's/\/v//g')"
wget -q --show-progress -O "$HOME"/.config/REAPER/UserPlugins/reaper_reapack-x86_64.so "$(wget -qO- https://api.github.com/repos/cfillion/reapack/releases|grep browser_download_url|grep download/v|grep x86_64.so|head -n1|cut -d '"' -f4)"
cd /tmp
rm -f /tmp/*.tar.xz
wget -q --show-progress https://sws-extension.org/download/pre-release/"$(wget -qO- http://sws-extension.org/download/pre-release/|grep Linux-x86_64|head -n1|cut -d '"' -f4)"
tar fx sws-*-Linux-x86_64-*.tar.xz -C "$HOME"/.config/REAPER
mkdir -p "$HOME"/.icons/Papirus-Dark/128x128/mimetypes
cp /usr/local/share/icons/hicolor/scalable/mimetypes/cockos-reaper-* "$HOME"/.icons/Papirus-Dark/128x128/mimetypes/
git clone https://github.com/mrbvrz/segoe-ui-linux
cd segoe-ui-linux
chmod +x install.sh
yes|sudo ./install.sh
