#!/bin/bash
set -e
TARGET="https://tytel.org$(wget -qO- https://tytel.org/helm/direct_downloads/|grep deb|grep amd64|cut -d '"' -f2)"
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb