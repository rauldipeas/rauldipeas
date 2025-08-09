#!/bin/bash
set -e
sudo clear
wget -q --show-progress -O- https://liquorix.net/install-liquorix.sh|sudo bash

# auto-cpufreq
cd /tmp
rm -fr /tmp auto-cpufreq
git clone https://github.com/AdnanHodzic/auto-cpufreq
cd auto-cpufreq
sudo ./auto-cpufreq-installer
if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ];then
    mkdir -p "$HOME"/.icons/Papirus-Dark/64x64/apps
    ln -fs /usr/share/icons/Papirus-Dark/64x64/apps/indicator-cpufreq.svg "$HOME"/.icons/Papirus-Dark/64x64/apps/auto-cpufreq.svg
fi