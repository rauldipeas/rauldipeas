#!/bin/bash
set -e
LN='org.musescore.MuseScore4portable'
SWMC='MuseScore4'
TARGET="$(wget -qO- https://api.github.com/repos/musescore/MuseScore/releases|grep browser_download_url|grep download/v|grep x86_64|head -n1|cut -d '"' -f4)"
EXEC_OLD='mscore4portable'
EXEC_NEW='musescore-studio'
ICON_OLD='mscore4portable'
ICON_NEW='musescore'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_appimage