#!/bin/bash
set -e
INSTNAME="curl\
     imagemagick\
     p7zip\
     xterm\
     zenity"
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
install_deb