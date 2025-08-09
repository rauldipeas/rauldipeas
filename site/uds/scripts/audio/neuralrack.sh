#!/bin/bash
set -e
mkdir -p /tmp/neuralrack
cd /tmp/neuralrack
rm -f /tmp/neuralrack/*.xz
wget -q --show-progress "$(curl -s https://api.github.com/repos/brummer10/NeuralRack/releases|grep browser_download_url|grep download|grep clap|grep x86_64|head -n1|cut -d '"' -f4)"
tar -xf NeuralRack*.tar.xz
mkdir -p "$HOME"/.clap
find "$PWD" -type f -name 'NeuralRack.clap' -exec cp '{}' "$HOME"/.clap/ \;