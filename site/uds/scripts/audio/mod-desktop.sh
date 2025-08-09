#!/bin/bash
set -e
mkdir -p /tmp/mod
cd /tmp/mod
rm -f /tmp/mod/*.xz
#wget -q --show-progress "$(curl -s https://api.github.com/repos/mod-audio/mod-desktop/releases|grep browser_download_url|grep download|grep linux-x86_64|head -n1|cut -d '"' -f4)"
wget -q --show-progress $(curl -s https://mod.audio/desktop|grep tar.xz|cut -d '"' -f4)
tar -xf mod-desktop*.tar.xz
rm mod-desktop*.tar.xz
cp -r mod-desktop*/mod-desktop "$HOME"/.local/share/
mkdir -p "$HOME"/.local/share/{applications,icons}
wget -q --show-progress -O "$HOME"/.local/share/icons/mod-desktop.svg https://raw.githubusercontent.com/mod-audio/mod-desktop/refs/heads/main/res/mod-logo.svg
cat <<EOF |tee "$HOME"/.local/share/applications/mod-desktop.desktop>/dev/null
[Desktop Entry]
Categories=AudioVideo;X-AudioEditing;Qt;
Exec=$HOME/.local/share/mod-desktop/mod-desktop
Icon=mod-desktop
Name=MOD Desktop
Terminal=false
Type=Application
Version=1.0
EOF