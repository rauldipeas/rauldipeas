#!/bin/bash
set -e
INSTNAME='diodon'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
install_deb
gsettings set net.launchpad.Diodon.clipboard add-images true
gsettings set net.launchpad.Diodon.clipboard recent-items-size 'uint32 18'