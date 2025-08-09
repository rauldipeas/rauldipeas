#!/bin/bash
set -e
TARGET='https://prerelease.keybase.io/keybase_amd64.deb'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb
wget -q --show-progress -O- https://keybase.io/docs/server_security/code_signing_key.asc|sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/keybase.gpg>/dev/null
sudo sed -i 's|deb http|deb [arch=amd64] http|' /etc/apt/sources.list.d/keybase.list