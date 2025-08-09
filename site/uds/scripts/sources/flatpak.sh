#!/bin/bash
set -e
INSTNAME='gnome-software-plugin-flatpak'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
install_deb
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo