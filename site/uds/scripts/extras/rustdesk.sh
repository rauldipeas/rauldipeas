#!/bin/bash
set -e
DEPS='libxdo3'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
install_deb
pacstall -IP rustdesk-deb