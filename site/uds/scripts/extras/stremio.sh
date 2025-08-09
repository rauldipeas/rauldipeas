#!/bin/bash
set -e
TARGET='https://dl.strem.io/shell-linux/v4.4.168/stremio_4.4.168-1_amd64.deb'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
enter_tmp
download
wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/"$(curl -s http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/|grep -oP 'libssl1.1_[^"]+?amd64\.deb'|sort -V|tail -n1)"
rm -fr "$PWD"/stremio_extract
dpkg-deb -R "$PWD"/stremio*.deb "$PWD"/stremio_extract
rm -f "$PWD"/stremio*.deb
sed -i 's/libmpv1 (>=0.30.0)/libmpv2/g' "$PWD"/stremio_extract/DEBIAN/control
sed -i 's/\x6C\x69\x62\x6D\x70\x76\x2E\x73\x6F\x2E\x31/\x6C\x69\x62\x6D\x70\x76\x2E\x73\x6F\x2E\x32/g' "$PWD"/stremio_extract/opt/stremio/stremio
dpkg-deb -b "$PWD"/stremio_extract "$PWD"/stremio_modified.deb
install_deb