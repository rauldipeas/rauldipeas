#!/bin/bash
set -e
BASENAME="dialect"
LN='app.drey.Dialect'
#SWMC=''
#TARGET="$()"
EXEC_OLD='dialect'
EXEC_NEW='env GDK_BACKEND=x11 dialect'
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='dialect'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
fix_launcher
install_deb
dconf reset -f /app/drey/Dialect/
dconf write /app/drey/Dialect/translators/google/dest-langs "['pt', 'es', 'de', 'en']"
dconf write /app/drey/Dialect/translators/google/init true