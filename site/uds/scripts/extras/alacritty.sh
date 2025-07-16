#!/bin/bash
set -e
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='alacritty'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
#fix_launcher
install_deb
#gsettings set org.gnome.desktop.default-applications.terminal exec alacrity
mkdir -p "$HOME"/.config/alacritty
cat <<EOF |tee "$HOME"/.config/alacritty/alacritty.toml>/dev/null
[colors.primary]
#background = "#00008b"  # darkblue
background = "#00360e"  # fosforgreen
foreground = "#ffffff"  # white

[font]
normal = { family = "Ubuntu Mono", style = "Regular" }
bold = { family = "Ubuntu Mono", style = "Bold" }
italic = { family = "Ubuntu Mono", style = "Italic" }
bold_italic = { family = "Ubuntu Mono", style = "Bold Italic" }
size = 11.0

[window]
opacity = 0.6
#dimensions = { columns = 80, lines = 24 }
EOF