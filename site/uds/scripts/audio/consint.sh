#!/bin/bash
set -e
mkdir -p /tmp/consint
cd /tmp/consint
rm -f /tmp/consint/*.zip
wget -q --show-progress "$(curl -s https://api.github.com/repos/consint/Pult-EQ/releases|grep browser_download_url|grep download|grep Linux|head -n1|cut -d '"' -f4)"
unzip -oqq '*.zip'
mkdir -p "$HOME"/.vst3
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;