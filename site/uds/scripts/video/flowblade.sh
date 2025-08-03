#!/bin/bash
set -e
BASENAME='flowblade'
LN='io.github.jliljebl.Flowblade'
SWMC='Flowblade'
INSTNAME='flowblade'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
fix_launcher
install_deb