#!/bin/bash
set -e
TARGET="$(curl -s https://xtradeb.net/wiki/how-to-install-applications-from-this-web-site|grep Noble|grep deb|cut -d '"' -f2)"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb