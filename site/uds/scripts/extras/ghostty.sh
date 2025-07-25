#!/bin/bash
set -e
BASENAME="ghostty"
LN='com.mitchellh.ghostty'
#SWMC=''
TARGET="$(wget -qO- https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases|grep browser_download_url|grep amd64_$(lsb_release -rs|tail -n1).deb|head -n1|cut -d '"' -f4)"
EXEC_OLD='ghostty$'
EXEC_NEW='ghostty-x11'
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
#INSTNAME=''
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
fix_launcher
install_deb
mkdir -p "$HOME"/.config/ghostty
cat <<EOF |tee "$HOME"/.config/ghostty/config>/dev/null
background = #00360e
background-opacity = 0.75
EOF
mkdir -p "$HOME"/.local/bin
cat <<EOF |tee "$HOME"/.local/bin/ghostty-x11>/dev/null
#!/bin/bash
env GDK_BACKEND=x11 ghostty
EOF
chmod +x "$HOME"/.local/bin/ghostty-x11
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$HOME"/.local/bin/ghostty-x11 50
sudo update-alternatives --set x-terminal-emulator "$HOME"/.local/bin/ghostty-x11