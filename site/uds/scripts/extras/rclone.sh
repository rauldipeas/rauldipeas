#!/bin/bash
set -e
TARGET="$(curl -s https://rclone.org/downloads|grep amd64.deb|head -n1|cut -d '"' -f4)"
DEPS='rclone-browser'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb