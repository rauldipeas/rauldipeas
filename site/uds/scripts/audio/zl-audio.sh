#!/bin/bash
set -e
mkdir -p /tmp/zl-audio
cd /tmp/zl-audio
rm -f /tmp/zl-audio/*.zip
wget -q --show-progress "$(curl -s https://api.github.com/repos/ZL-Audio/ZLCompressor/releases|grep browser_download_url|grep download|grep Linux-x86|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/ZL-Audio/ZLEqualizer/releases|grep browser_download_url|grep download|grep Linux-x86|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/ZL-Audio/ZLInflator/releases|grep browser_download_url|grep download|grep zip|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/ZL-Audio/ZLLMakeup/releases|grep browser_download_url|grep download|grep zip|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/ZL-Audio/ZLLMatch/releases|grep browser_download_url|grep download|grep zip|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/ZL-Audio/ZLSplitter/releases|grep browser_download_url|grep download|grep Linux|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/ZL-Audio/ZLWarm/releases|grep browser_download_url|grep download|grep zip|head -n1|cut -d '"' -f4)"
unzip -oqq '*.zip'
mkdir -p "$HOME"/.vst3
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;