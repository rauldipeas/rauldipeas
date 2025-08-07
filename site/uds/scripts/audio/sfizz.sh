#!/bin/bash
set -e
printf 'deb http://download.opensuse.org/repositories/home:/sfztools:/sfizz/xUbuntu_24.04/ /'|sudo tee /etc/apt/sources.list.d/home:sfztools:sfizz.list>/dev/null
wget -q --show-progress -O- https://download.opensuse.org/repositories/home:sfztools:sfizz/xUbuntu_24.04/Release.key|sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/home_sfztools_sfizz.gpg>/dev/null
sudo apt update
sudo apt install -y --reinstall sfizz