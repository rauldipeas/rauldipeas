#!/bin/bash
set -e
DEPS="cmake\
    g++\
    libpython3-dev\
    libqt5svg5-dev\
    libarchive-dev\
    libavcodec-dev\
    libavformat-dev\
    libavutil-dev\
    libpotrace-dev\
    libswscale-dev\
    qt5-image-formats-plugins\
    qtbase5-dev\
    qttools5-dev\
    zlib1g-dev"
#bzip2-doc cmake cmake-data comerr-dev libacl1-dev libarchive-dev libattr1-dev libbz2-dev libclang1-15t64 libext2fs-dev libgmp-dev libgmpxx4ldbl libllvm15t64 liblz4-dev libpotrace-dev libpotrace0 libqt5designer5 libqt5designercomponents5 libqt5help5 libqt5sensors5 libqt5svg5-dev libqt5webkit5 librhash0 nettle-dev qdoc-qt5 qhelpgenerator-qt5 qt5-assistant qt5-image-formats-plugins qtattributionsscanner-qt5 qttools5-dev qttools5-dev-tools
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
install_deb
git clone -q --recursive https://gitlab.com/mattbas/glaxnimate
cd glaxnimate
mkdir build
cd build
cmake ..
make
make translations
sudo make install
cd /tmp
rm -fr /tmp/glaxnimate
printf '\nStartupWMClass=glaxnimate'|sudo tee -a /usr/local/share/applications/org.mattbas.Glaxnimate.desktop>/dev/null