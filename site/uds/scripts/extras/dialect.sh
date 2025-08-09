#!/bin/bash
set -e
INSTNAME='dialect'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
install_deb
dconf reset -f /app/drey/Dialect/
dconf write /app/drey/Dialect/translators/google/dest-langs "['pt', 'es', 'de', 'en']"
dconf write /app/drey/Dialect/translators/google/init true