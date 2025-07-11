#!/bin/bash
set -e
mkdir -p /tmp/lim
cd /tmp/lim
rm -f /tmp/lim/*.zip
wget -q --show-progress https://audioplugins.lim.di.unimi.it/plugins/content/TheMasker.zip
unzip -oqq '*.zip'
cd TheMasker
unzip -oqq '*.zip'
cd Linux
mkdir -p "$HOME"/.vst3
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;