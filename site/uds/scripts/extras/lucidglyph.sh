#!/bin/bash
set -e
cd /tmp
rm -fr /tmp/lucidglyph
git clone -q https://github.com/maximilionus/lucidglyph
cd lucidglyph
sudo ./lucidglyph.sh install