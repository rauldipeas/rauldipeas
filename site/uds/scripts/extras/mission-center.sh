#!/bin/bash
set -e
BASENAME='missioncenter'
LN='mission-center-AM'
SWMC='io.missioncenter.MissionCenter'
ICON_OLD='mission-center'
ICON_NEW='io.missioncenter.MissionCenter'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
fix_launcher
am -i --icons mission-center
sudo bash /usr/local/share/custom-launchers/missioncenter
