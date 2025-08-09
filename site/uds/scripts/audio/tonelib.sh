#!/bin/bash
set -e
TARGET="https://github.com/PetrusNoleto/Error-in-install-cisco-packet-tracer-in-ubuntu-23.10-unmet-dependencies/releases/download/CiscoPacketTracerFixUnmetDependenciesUbuntu23.10/libgl1-mesa-glx_23.0.4-0ubuntu1.22.04.1_amd64.deb"
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
# Freeware
wget -q --show-progress -O ToneLib-BaxEq-amd64.deb 'https://tonelib.net/download.php?id=bax&os=lnx'
wget -q --show-progress -O ToneLib-EasyComp-amd64.deb 'https://tonelib.net/download.php?id=ecmp&os=lnx'
wget -q --show-progress -O ToneLib-BassDrive-amd64.deb 'https://tonelib.net/download.php?id=bassdrive&os=lnx'
wget -q --show-progress -O ToneLib-NoiseReducer-amd64.deb 'https://tonelib.net/download.php?id=noisereducer&os=lnx'
wget -q --show-progress -O ToneLib-TubeWarmth-amd64.deb 'https://tonelib.net/download.php?id=tubewarmth&os=lnx'
# Free trials
wget -q --show-progress -O ToneLib-DistRaptor-amd64.deb 'https://tonelib.net/download.php?id=dstr&os=lnx'
wget -q --show-progress -O ToneLib-Detuner-amd64.deb 'https://tonelib.net/download.php?id=dtn&os=lnx'
wget -q --show-progress -O ToneLib-GFX-amd64.deb 'https://tonelib.net/download.php?id=gfx&os=lnx'
wget -q --show-progress -O ToneLib-Metal-amd64.deb 'https://tonelib.net/download.php?id=mtl&os=lnx'
wget -q --show-progress -O ToneLib-MultiComp-amd64.deb 'https://tonelib.net/download.php?id=mcmp&os=lnx'
install_deb