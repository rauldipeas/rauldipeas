#!/bin/bash
set -e
mkdir -p /tmp/hy-plugins
cd /tmp/hy-plugins
rm -f /tmp/hy-plugins/*.zip
wget -q --show-progress "$(curl -s https://hy-plugins.com/product/hy-mbmfx3/|grep linux.zip|grep free|cut -d '"' -f18)"
unzip -oqq '*.zip'
mkdir -p "$HOME"/.vst3
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;
mkdir -p "$HOME"/.config/HY-Plugins
cp -r "$PWD"/HY-MBMFX3\ free\ linux/HY-MBMFX3\ free "$HOME"/.config/HY-Plugins/