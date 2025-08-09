#!/bin/bash
set -e
mkdir -p /tmp/magnetophon
cd /tmp/magnetophon
rm -f /tmp/magnetophon/*.zip
wget -q --show-progress "$(curl -s https://api.github.com/repos/magnetophon/DEL2/releases|grep browser_download_url|grep download|grep ubuntu|head -n1|cut -d '"' -f4)"
wget -q --show-progress "$(curl -s https://api.github.com/repos/magnetophon/lamb-rs/releases|grep browser_download_url|grep download|grep ubuntu|head -n1|cut -d '"' -f4)"
unzip -oqq '*.zip'
mkdir -p "$HOME"/.clap
find "$PWD" -type f -name '*.clap' -exec cp -r '{}' "$HOME"/.clap/ \;