#!/bin/bash
set -e
if [ $XDG_CURRENT_DESKTOP == ubuntu:GNOME ];then
    if command -v snap>/dev/null;then
        snap list|awk 'NR>1 {print $1}'|grep -v bare|grep -v core22|grep -v snapd|xargs -r -n1 sudo snap remove --purge
        sudo apt autoremove --purge -y snapd
        sudo rm -fr "$HOME"/snap /snap /var/snap /var/lib/snapd
        sudo apt-mark hold snapd
        printf 'Package: snapd\nPin: release a=*\nPin-Priority: -10'|sudo tee /etc/apt/preferences.d/nosnap>/dev/null
        sudo apt install -y --reinstall gnome-software
    fi
fi