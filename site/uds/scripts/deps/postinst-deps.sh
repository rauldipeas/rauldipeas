#!/bin/bash
set -e
INSTNAME="curl\
     imagemagick\
     p7zip\
     xterm\
     zenity"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
install_deb