#!/bin/bash
set -e
PROTON_VPN_VERSION="$(curl -s https://repo.protonvpn.com/debian/dists/stable/main/binary-all/|grep -oP 'protonvpn-stable-release_\K[0-9.]+(?=_all\.deb)'|sort -V|tail -n1)"
TARGET="$(printf https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_${PROTON_VPN_VERSION}_all.deb)"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
install_deb
sudo apt update
sudo apt install -y --reinstall proton-vpn-gnome-desktop
