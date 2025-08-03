#!/bin/bash
set -e
TARGET="$(wget -qO- https://peazip.github.io/peazip-linux.html|grep GTK|grep deb|cut -d '"' -f2)"
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb