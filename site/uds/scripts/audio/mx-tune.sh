#!/bin/bash
set -e
cd /tmp
rm -f /tmp/*.zip
wget -q --show-progress "$(curl -s https://api.github.com/repos/liuanlin-mx/MXTune/releases|grep browser_download_url|grep download|grep x86_64|grep ubuntu|head -n1|cut -d '"' -f4)"
mkdir -p "$HOME"/.vst
unzip -oqq ubuntu*x86_64*.zip>/dev/null
rm ubuntu*x86_64*.zip
rm -fr "$HOME"/.vst/mx_tune.so
mv /tmp/ubuntu*x86_64*/*.so "$HOME"/.vst/