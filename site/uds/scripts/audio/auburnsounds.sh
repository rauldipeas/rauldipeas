#!/bin/bash
set -e
mkdir -p /tmp/auburnsounds
cd /tmp/auburnsounds
rm -f /tmp/auburnsounds/*.zip
curl -s https://www.auburnsounds.com/faq/Where-may-I-find-older-versions.html|grep recommended|cut -d '"' -f 2|sed 's|..|https://www.auburnsounds.com/|'|xargs wget -q --show-progress
unzip -oqq '*.zip'
mkdir -p "$HOME"/.vst3
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;