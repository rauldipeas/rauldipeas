#!/bin/bash
set -e
LN='Shutter_Encoder'
SWMC='application-Shutter'
versao=$(wget -qO- 'https://www.shutterencoder.com/old%20versions/Linux/'|grep -Po 'Shutter Encoder \K[0-9]+\.[0-9]+'|sort -V | tail -1)
IFS=. read -r major minor <<< "$versao"
minor=$((minor + 1))
TARGET="https://www.shutterencoder.com/Shutter%20Encoder%20${major}.${minor}%20Linux%2064bits.deb"
#EXEC_OLD=''
#EXEC_NEW=''
ICON_OLD='/usr/lib/Shutter\ Encoder/usr/bin/icon.png'
ICON_NEW='shutter-encoder'
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh(enter_tmp
download
fix_launcher
mv /tmp/Shutter*.deb /tmp/shutter-encoder.deb
install_deb
sudo ln -sf /usr/lib/Shutter\ Encoder/usr/bin/icon.png /usr/share/icons/hicolor/256x256/shutter-encoder.png