#!/bin/bash
set -e
TICKTICK_VERSION="$(curl https://snapcraft.io/ticktick|grep stable|grep version|cut -d '"' -f 28)"
TARGET="https://d2atcrkye2ik4e.cloudfront.net/download/linux/linux_deb_x64/ticktick-"$TICKTICK_VERSION"-amd64.deb"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb