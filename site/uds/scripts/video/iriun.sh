#!/bin/bash
set -e
TARGET="$(curl -sL https://iriun.com/|grep deb|cut -d '"' -f4)"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
if grep -E "liquorix|xanmod" <(uname -r);then
    cd /tmp
    rm -fr /tmp/v4l2loopback*
    wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/universe/v/v4l2loopback/"$(curl -s http://archive.ubuntu.com/ubuntu/pool/universe/v/v4l2loopback/|grep -oP 'v4l2loopback-dkms_[^"]+?\.deb'|sort -V|tail -n1)"
    sudo apt install -y --reinstall ./v4l2loopback*.deb
#    git clone -q https://github.com/v4l2loopback/v4l2loopback
#    cd "$PWD"/v4l2loopback
#    make
#    sudo apt install -y --reinstall checkinstall
#    sudo checkinstall --pkgname=v4l2loopback --pkgversion="$(git describe --tags | sed 's/v//')" --backup=no --deldoc=yes --fstrans=no --default --provides=v4l2loopback-dkms
#    sudo depmod -a
#    sudo modprobe v4l2loopback
fi
install_deb
if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ];then
    mkdir -p "$HOME"/.icons/Papirus-Dark/64x64/apps
    ln -fs /usr/share/icons/Papirus-Dark/64x64/apps/webcamoid.svg "$HOME"/.icons/Papirus-Dark/64x64/apps/iriunwebcam.svg
fi