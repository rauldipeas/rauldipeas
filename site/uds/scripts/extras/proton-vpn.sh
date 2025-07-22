#!/bin/bash
set -e
#BASENAME=''
#LN=''
#SWMC=''
PROTON_VPN_VERSION="$(wget -qO- https://repo.protonvpn.com/debian/dists/stable/main/binary-all/|grep -oP 'protonvpn-stable-release_\K[0-9.]+(?=_all\.deb)'|sort -V|tail -n1)"
TARGET="$(printf https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_${PROTON_VPN_VERSION}_all.deb)"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
#fix_launcher
install_deb
sudo apt update
sudo apt install -y proton-vpn-gnome-desktop
