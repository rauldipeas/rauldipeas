#!/bin/bash
set -e
BASENAME='missioncenter'
LN='mission-center-AM'
SWMC='io.missioncenter.MissionCenter'
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
ICON_OLD='mission-center'
ICON_NEW='io.missioncenter.MissionCenter'
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
fix_launcher
am -i --icons mission-center
sudo bash /usr/local/share/custom-launchers/missioncenter
#install_deb