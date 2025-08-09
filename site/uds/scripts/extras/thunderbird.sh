#!/bin/bash
set -e
DEPS='thunderbird-locale-pt-br'
PPA='mozillateam/ppa'
INSTNAME='thunderbird-gnome-support'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
add_ppa
cat <<EOF |sudo tee /etc/apt/preferences.d/thunderbird
Package: thunderbird*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
EOF
install_deb