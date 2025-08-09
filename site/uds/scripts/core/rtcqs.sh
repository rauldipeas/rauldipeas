#!/bin/bash
set -e
DEPS="pipx\
    python3-tk"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
install_deb
pipx install --force rtcqs
mkdir -p "$HOME"/.local/share/{applications,icons}
wget -q --show-progress -O "$HOME"/.local/share/applications/rtcqs.desktop https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs.desktop
wget -q --show-progress -O "$HOME"/.local/share/icons/rtcqs.svg https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs_logo.svg
if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ];then
    mkdir -p "$HOME"/.icons/Papirus-Dark/64x64/apps
    ln -fs /usr/share/icons/Papirus-Dark/64x64/apps/utilities-log-viewer.svg "$HOME"/.icons/Papirus-Dark/64x64/apps/rtcqs.svg
fi