#!/bin/bash
set -e
## AM
sudo bash -c "$(wget -qO- https://github.com/ivan-hc/AM/raw/main/INSTALL)"

## Pacstall
yes|sudo bash -c "$(wget -qO- https://pacstall.dev/q/install)"

## Topgrade
am -i topgrade
mkdir -p "$HOME"/.local/share/applications
if command -v alacritty>/dev/null;then
	cat <<EOF |tee "$HOME"/.local/share/applications/topgrade.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=Topgrade
Exec=alacritty --title 'Topgrade' -o window.dimensions.columns=80 -o window.dimensions.lines=24 -e bash -c "topgrade; echo 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=update-manager
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF
	else
	cat <<EOF |tee "$HOME"/.local/share/applications/topgrade.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=Topgrade
Exec=xterm -T 'Topgrade' -fa 'Ubuntu Mono' -fs 11 -bg "#300a25" -fg white -e bash -c "topgrade; echo 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=update-manager
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF
fi