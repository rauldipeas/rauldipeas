#!/bin/bash
set -e
sudo mkdir -p /etc/apt/keyrings
wget -q --show-progress -O- https://packages.microsoft.com/keys/microsoft.asc|sudo gpg --dearmor --yes -o /usr/share/keyrings/microsoft.gpg
cat <<EOF |sudo tee /etc/apt/sources.list.d/vscode.sources>/dev/null
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
sudo apt update
sudo apt install -y code
