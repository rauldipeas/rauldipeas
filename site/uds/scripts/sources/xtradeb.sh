#!/bin/bash
set -e
TARGET="$(wget -qO- https://xtradeb.net/wiki/how-to-install-applications-from-this-web-site|grep Noble|grep deb|cut -d '"' -f2)"
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb