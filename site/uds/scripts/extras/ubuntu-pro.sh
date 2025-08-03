#!/bin/bash
set -e
INSTNAME='ubuntu-advantage-tools'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
install_deb
sudo pro attach