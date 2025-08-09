#!/bin/bash
set -e
TARGET="$(curl -s https://api.github.com/repos/surge-synthesizer/releases-xt/releases|grep browser_download_url|grep deb|head -n1|cut -d '"' -f4)"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb