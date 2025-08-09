#!/bin/bash
set -e
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
MEGASYNCVERSION="xUbuntu_24.04"
wget -q --show-progress https://mega.nz/linux/repo/"$MEGASYNCVERSION"/amd64/megasync-"$MEGASYNCVERSION"_amd64.deb
if command -v nautilus>/dev/null;then
    wget -q --show-progress https://mega.nz/linux/repo/"$MEGASYNCVERSION"/amd64/nautilus-megasync-"$MEGASYNCVERSION"_amd64.deb
fi
install_deb