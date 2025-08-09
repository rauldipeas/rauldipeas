#!/bin/bash
set -e
mkdir -p /tmp/bluewingsmusic
cd /tmp/bluewingsmusic
rm -f /tmp/bluewingsmusic/*.zip
wget -q --show-progress "$(curl -s https://api.github.com/repos/jerryuhoo/Fire/releases|grep browser_download_url|grep download|grep Linux|head -n1|cut -d '"' -f4)"
unzip -oqq '*.zip'
mkdir -p "$HOME"/.clap
find "$PWD" -type f -name '*.clap' -exec cp -r '{}' "$HOME"/.clap/ \;