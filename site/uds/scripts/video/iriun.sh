#!/bin/bash
set -e
BASENAME='iriun'
LN='iriunwebcam'
TARGET="$(curl -sL https://iriun.com/|grep deb|cut -d '"' -f4)"
ICON_OLD='iriunwebcam'
ICON_NEW='webcamoid'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
if grep -E "liquorix|xanmod" <(uname -r);then
    cd /tmp
    rm -rf /tmp/v4l2loopback*
    wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/universe/v/v4l2loopback/"$(wget -qO- http://archive.ubuntu.com/ubuntu/pool/universe/v/v4l2loopback/|grep -oP 'v4l2loopback-dkms_[^"]+?\.deb'|sort -V|tail -n1)"
    sudo apt install -y --reinstall ./v4l2loopback*.deb
#    git clone https://github.com/v4l2loopback/v4l2loopback.git
#    cd "$PWD"/v4l2loopback
#    make
#    sudo apt install -y --reinstall checkinstall
#    sudo checkinstall --pkgname=v4l2loopback --pkgversion="$(git describe --tags | sed 's/v//')" --backup=no --deldoc=yes --fstrans=no --default --provides=v4l2loopback-dkms
#    sudo depmod -a
#    sudo modprobe v4l2loopback
fi
install_deb