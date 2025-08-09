#!/bin/bash
set -e
mkdir -p /tmp/aether
cd /tmp/aether
rm -f /tmp/aether/*.xz
wget -q --show-progress "$(curl -s https://api.github.com/repos/Dougal-s/Aether/releases|grep browser_download_url|grep download|grep Linux|head -n1|cut -d '"' -f4)"
tar -xf Aether*.tar.xz
mkdir -p "$HOME"/.lv2
find "$PWD" -type d -name '*.lv2' -exec cp -r '{}' "$HOME"/.lv2/ \;