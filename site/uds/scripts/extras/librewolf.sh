#!/bin/bash
set -e
sudo apt install -y --reinstall extrepo
sudo extrepo enable librewolf
sudo apt update
sudo apt install -y --reinstall chrome-gnome-shell librewolf
