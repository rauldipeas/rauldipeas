#!/bin/bash
set -e
mkdir -p /tmp/audio-assault
cd /tmp/audio-assault
rm -f /tmp/audio-assault/*.zip
curl -s https://audioassault.mx/downloadAudioAssault|grep LockerLinux|cut -d '"' -f2|xargs wget -q --show-progress
unzip -oqq '*.zip'
mkdir -p "$HOME"/{.vst3,Audio\ Assault/PluginData/Audio\ Assault}
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;
find "$PWD" -type d -name '*LockerData' -exec cp -r '{}' "$HOME"/Audio\ Assault/PluginData/Audio\ Assault/ \;