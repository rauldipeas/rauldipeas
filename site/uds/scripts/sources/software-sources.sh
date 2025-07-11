#!/bin/bash
set -e
## AM
sudo bash -c "$(wget -qO- https://github.com/ivan-hc/AM/raw/main/INSTALL)"

## Pacstall
yes|sudo bash -c "$(wget -qO- https://pacstall.dev/q/install)"

## Topgrade
am -i topgrade