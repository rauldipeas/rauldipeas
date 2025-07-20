#!/bin/bash
set -e
mkdir -p /tmp/audio-assault
cd /tmp/audio-assault
rm -f /tmp/audio-assault/*.zip
wget -qO- https://audioassault.mx/downloadAudioAssault|grep LockerLinux|cut -d '"' -f2|xargs wget -q --show-progress
unzip -oqq '*.zip'
mkdir -p "$HOME"/{.local/bin,.local/share/applications,.vst3,Audio\ Assault/PluginData/Audio\ Assault}
find "$PWD" -type d -name '*.vst3' -exec cp -r '{}' "$HOME"/.vst3/ \;
find "$PWD" -type d -name '*LockerData' -exec cp -r '{}' "$HOME"/Audio\ Assault/PluginData/Audio\ Assault/ \;
cp Amp\ Locker\ Standalone "$HOME"/.local/bin/amp-locker
cat <<EOF |tee "$HOME"/.local/share/applications/amp-locker>/dev/null
[Desktop Entry]
Type=Application
Name=Amp Locker
Exec=amp-locker
#Icon=amp-locker
Icon=guitarix
Terminal=false
Categories=Audio;
StartupNotify=true
EOF