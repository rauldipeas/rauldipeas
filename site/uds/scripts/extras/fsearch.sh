#!/bin/bash
set -e
PPA='christian-boxdoerfer/fsearch-stable'
INSTNAME='fsearch'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
add_ppa
install_deb
if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ];then
    mkdir -p "$HOME"/.icons/Papirus-Dark/64x64/apps
    ln -fs /usr/share/icons/Papirus-Dark/64x64/apps/gnome-search-tool.svg "$HOME"/.icons/Papirus-Dark/64x64/apps/io.github.cboxdoerfer.FSearch.svg
fi