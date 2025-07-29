#!/bin/bash

URL_BASE="https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps"
ICONS=(
  deepin-repair-tools
  system-software-update
  com.github.bartzaalberg.snaptastic
  yast-hwinfo
  GPU_Viewer
  distributor-logo-ubuntu-studio
  laditools
  utilities-log-viewer
  system-software-install
  distributor-logo-debian
  io.github.flattool.Warehouse
  synaptic
  musescore
  cockos-reaper
  tenacity
  preferences-plugin
  q4wine
  wine
  airwave-manager
  pulseeffects
  obs
  webcamoid
  resolve
  shutter-encoder
  blender
  natron
  flowblade
  kdenlive
  ktimer
  gimp
  inkscape
  gcolor3
)

for icon in "${ICONS[@]}"; do
  wget -cq --show-progress "$URL_BASE/$icon.svg" -O "$icon.svg"
done
