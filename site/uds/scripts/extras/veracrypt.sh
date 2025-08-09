#!/bin/bash
set -e
PPA='unit193/encryption'
INSTNAME='veracrypt'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
add_ppa
install_deb
mkdir -p "$HOME"/{.config/autostart,.local/bin}
cat <<EOF |tee "$HOME"/.config/autostart/veracrypt.desktop>/dev/null
[Desktop Entry]
Type=Application
Exec=veracrypt-mount
Icon=veracrypt
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Montar VeraCrypt
EOF
cat <<EOF |tee "$HOME"/.local/bin/veracrypt-mount>/dev/null
#!/bin/bash
set -e
#veracrypt /caminho/volume.crypt /media/veracrypt1
EOF
chmod +x "$HOME"/.local/bin/veracrypt-mount