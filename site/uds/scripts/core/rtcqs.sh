#!/bin/bash
set -e
DEPS="pipx\
    python3-tk"
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
install_deb
pipx install --force rtcqs
mkdir -p "$HOME"/.local/share/{applications,icons}
wget -q --show-progress -O "$HOME"/.local/share/applications/rtcqs.desktop https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs.desktop
wget -q --show-progress -O "$HOME"/.local/share/icons/rtcqs.png https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs_logo.svg