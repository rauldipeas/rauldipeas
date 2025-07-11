#!/bin/bash
set -e
sudo apt install -y extrepo
sudo extrepo enable librewolf
sudo apt update
sudo apt install -y chrome-gnome-shell librewolf
