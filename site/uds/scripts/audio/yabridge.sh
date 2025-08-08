#!/bin/bash
set -e
pacstall -IP yabridge
mkdir -p "$HOME"/.wine/drive_c/Program\ Files/{VSTPlugins,Common\ Files/VST3}
yabridgectl add "$HOME"/.wine/drive_c/Program\ Files/Common\ Files/VST3
yabridgectl add "$HOME"/.wine/drive_c/Program\ Files/VSTPlugins
if [ $XDG_SESSION_TYPE == wayland ];then
	printf 'Wayland'
	sudo systemctl mask rtkit-daemon.service #https://linuxmusicians.com/viewtopic.php?t=26386&start=15
	else
	printf 'X11'
fi
yabridgectl sync --prune --verbose
if command -v gnome-terminal>/dev/null;then
	cat <<EOF |tee "$HOME"/.local/share/applications/yabridge-sync.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=yabridge sync
Exec=gnome-terminal --title="yabridge sync" --geometry=80x24 -- bash -c "yabridgectl sync --prune --verbose; echo 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=blueman-plugin
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
Icon=blueman-plugin
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF
fi
if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ];then
    mkdir -p "$HOME"/.icons/Papirus-Dark/64x64/apps
    ln -fs /usr/share/icons/Papirus-Dark/64x64/apps/airwave-manager.svg "$HOME"/.icons/Papirus-Dark/64x64/apps/blueman-plugin.svg
fi