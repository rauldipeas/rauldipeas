#!/bin/bash
set -e
LN='iriunwebcam'
#SWMC=''
TARGET="$(curl -sL https://iriun.com/|grep deb|cut -d '"' -f4)"
EXEC_OLD='/usr/local/bin/iriunwebcam'
EXEC_NEW='env QT_QPA_PLATFORM=xcb iriunwebcam'
ICON_OLD='iriunwebcam'
ICON_NEW='webcamoid'
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
if grep -E "liquorix|xanmod" <(uname -r);then
    cd /tmp
    rm -rf /tmp/v4l2loopback
    git clone https://github.com/v4l2loopback/v4l2loopback.git
    cd "$PWD"/v4l2loopback
    make
    sudo apt install -y checkinstall
    sudo checkinstall --pkgname=v4l2loopback --pkgversion="$(git describe --tags | sed 's/v//')" --backup=no --deldoc=yes --fstrans=no --default --provides=v4l2loopback-dkms
    sudo depmod -a
    sudo modprobe v4l2loopback
fi
install_deb