#!/bin/bash
set -e
wget -qO- https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg|sudo gpg --dearmor --yes -o /usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main'|sudo tee /etc/apt/sources.list.d/vscodium.list>/dev/null
sudo apt update
sudo apt install -y codium