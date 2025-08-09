#!/bin/bash
set -e
TARGET="$(curl -s https://peazip.github.io/peazip-linux.html|grep GTK|grep deb|cut -d '"' -f2)"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb