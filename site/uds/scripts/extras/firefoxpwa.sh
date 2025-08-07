#!/bin/bash
set -e
sudo clear
wget -q --show-progress -O- https://packagecloud.io/filips/FirefoxPWA/gpgkey|sudo gpg --dearmor --yes -o /usr/share/keyrings/firefoxpwa-keyring.gpg
printf 'deb [signed-by=/usr/share/keyrings/firefoxpwa-keyring.gpg] https://packagecloud.io/filips/FirefoxPWA/any any main'|sudo tee /etc/apt/sources.list.d/firefoxpwa.list>/dev/null
sudo apt update
sudo apt install -y --reinstall firefoxpwa