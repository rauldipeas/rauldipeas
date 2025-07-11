#!/bin/bash
set -e
#!/bin/bash
set -e

## KDE
### TouchPad (TODO)
# tap-to-click
# natural-scrolling
### Night-light (TODO)
# 3500k
### Full-screen app launcher
### KWin
# Thumbnail grid
### Krohnkite (KWin scripts)
plasmapkg2 -t kwinscript -i krohnkite.kwinscript # installing new script
plasmapkg2 -t kwinscript -u krohnkite.kwinscript # upgrading existing script
mkdir -p ~/.local/share/kservices5/
ln -s ~/.local/share/kwin/scripts/krohnkite/metadata.desktop ~/.local/share/kservices5/krohnkite.desktop
#kwriteconfig5 --file ~/.config/kdeglobals --group WM --key frame 61,174,233
#kwriteconfig5 --file ~/.config/kdeglobals --group WM --key inactiveFrame  239,240,241

## Chat GPT
sudo snap install chatgpt-desktop-client

# Filelight
sudo apt install filelight