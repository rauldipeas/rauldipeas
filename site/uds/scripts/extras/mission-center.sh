#!/bin/bash
set -e
BASENAME='missioncenter'
LN='mission-center-AM'
SWMC='io.missioncenter.MissionCenter'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
fix_launcher
am -i --icons mission-center
sudo bash /usr/local/share/custom-launchers/missioncenter
if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ];then
    mkdir -p "$HOME"/.icons/Papirus-Dark/64x64/apps
    ln -fs /usr/share/icons/Papirus-Dark/64x64/apps/io.missioncenter.MissionCenter.svg "$HOME"/.icons/Papirus-Dark/64x64/apps/mission-center.svg
fi