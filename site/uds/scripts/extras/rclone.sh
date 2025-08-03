#!/bin/bash
set -e
TARGET="$(wget -qO- https://rclone.org/downloads|grep amd64.deb|head -n1|cut -d '"' -f4)"
DEPS='rclone-browser'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb