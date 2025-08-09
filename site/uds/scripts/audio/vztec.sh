#!/bin/bash
set -e
mkdir -p /tmp/vztec
cd /tmp/vztec
rm -f /tmp/vztec/*.zip
wget -q --show-progress -O overdrive.zip "$(curl -s https://en.vztecfx.com/overdrive-plugin|grep Linux.zip|cut -d '"' -f 38)"
wget -q --show-progress -O malibu.zip "$(curl -s https://en.vztecfx.com/malibu-plugin|grep Linux|grep Installer.zip|cut -d '"' -f 38)"
unzip -oqq overdrive.zip>/dev/null
unzip -oqq malibu.zip>/dev/null
rm *.zip
mkdir -p "$HOME"/.vst3
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;