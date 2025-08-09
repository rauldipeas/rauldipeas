#!/bin/bash
set -e
mkdir -p /tmp/artv
cd /tmp/artv
rm -f /tmp/artv/*.zip
wget -q --show-progress "$(curl -s https://api.github.com/repos/RafaGago/artv-audio/releases|grep browser_download_url|grep download|grep turbopaco|grep linux|grep vst3.zip|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/RafaGago/artv-audio/releases|grep browser_download_url|grep download|grep mixmaxtrix|grep linux|grep vst3.zip|head -n1|cut -d '"' -f4)"
unzip -oqq '*.zip'
mkdir -p "$HOME"/.vst3
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;