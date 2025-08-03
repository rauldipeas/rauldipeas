#!/bin/bash
set -e
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
wget -qO- https://chowdsp.com/products.html|grep deb|grep -v ChowCentaur|grep -v ChowPhaser|cut -d '"' -f2|xargs wget -q --show-progress
install_deb