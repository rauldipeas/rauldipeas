#!/bin/bash
set -e
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='dialect'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
#fix_launcher
install_deb
dconf write /app/drey/Dialect/translators/google/dest-langs "['pt', 'es', 'de', 'en']"