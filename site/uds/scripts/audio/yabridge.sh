#!/bin/bash
set -e
LANGUAGE=en pacstall -IP yabridge
mkdir -p "$HOME"/.wine/drive_c/Program\ Files/{VSTPlugins,Common\ Files/VST3}
yabridgectl add "$HOME"/.wine/drive_c/Program\ Files/Common\ Files/VST3
yabridgectl add "$HOME"/.wine/drive_c/Program\ Files/VSTPlugins
if [ $XDG_SESSION_TYPE == wayland ];then
	printf 'Wayland'
	sudo systemctl mask rtkit-daemon.service #https://linuxmusicians.com/viewtopic.php?t=26386&start=15
	#sudo apt autoremove --purge rtkit
	else
	printf 'X11'
fi
yabridgectl sync --prune --verbose
if command -v alacritty>/dev/null;then
	cat <<EOF |tee "$HOME"/.local/share/applications/yabridge-sync.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=yabridge sync
Exec=alacritty --title "yabridge sync" -o window.dimensions.columns=80 -o window.dimensions.lines=24 -e bash -c "yabridgectl sync --prune --verbose; echo 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=airwave-manager
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF
	else
	cat <<EOF |tee "$HOME"/.local/share/applications/yabridge-sync.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=yabridge sync
Exec=xterm -T 'yabridge sync' -fa 'Ubuntu Mono' -fs 11 -bg "#300a25" -fg white -e bash -c "yabridgectl sync --prune --verbose; echo 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=airwave-manager
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF
fi