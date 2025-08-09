#!/bin/bash
set -e
cd /tmp
rm -f /tmp/*.7z
wget -q --show-progress "$(curl -s https://api.github.com/repos/lsp-plugins/lsp-plugins/releases|grep browser_download_url|grep download|grep Linux-x86_64|head -n1|cut -d '"' -f4)"
7za x -y -bsp0 lsp-plugins-*-Linux-x86_64.7z>/dev/null
mkdir -p "$HOME"/.vst3
rm -fr "$HOME"/.vst3/lsp-plugins.vst3
mv /tmp/lsp-plugins-*-Linux-x86_64/VST3/lsp-plugins.vst3 "$HOME"/.vst3/