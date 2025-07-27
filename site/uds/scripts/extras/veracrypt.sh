#!/bin/bash
set -e
#BASENAME=''
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
PPA='unit193/encryption'
INSTNAME='veracrypt'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
add_ppa
#fix_launcher
install_deb
mkdir -p "$HOME"/{.config/autostart,.local/bin}
cat <<EOF |tee "$HOME"/.config/autostart/veracrypt.desktop>/dev/null
[Desktop Entry]
Type=Application
Exec=veracrypt-mount
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