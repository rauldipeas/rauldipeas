#!/bin/bash
set -e
mkdir -p /tmp/dexed
cd /tmp/dexed
rm -f /tmp/dexed/*.zip
wget -q --show-progress "$(curl -s https://api.github.com/repos/asb2m10/dexed/releases|grep browser_download_url|grep download|grep lnx|head -n1|cut -d '"' -f4)"
unzip -oqq '*.zip'
mkdir -p "$HOME"/.clap
find "$PWD" -type f -name '*.clap' -exec cp -r '{}' "$HOME"/.clap/ \;