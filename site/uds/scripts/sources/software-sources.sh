#!/bin/bash
set -e
## AM
sudo bash -c "$(curl -s https://github.com/ivan-hc/AM/raw/main/INSTALL)"

## Pacstall
yes|sudo bash -c "$(curl -s https://pacstall.dev/q/install)"

## Topgrade
cd /tmp
rm -f /tmp/*.deb
wget -q --show-progress "$(curl -s https://api.github.com/repos/topgrade-rs/topgrade/releases|grep browser_download_url|grep deb|head -n1|cut -d '"' -f4)"
sudo apt install -y --reinstall ./topgrade*.deb
mkdir -p "$HOME"/.local/share/applications
if command -v gnome-terminal>/dev/null;then
	cat <<EOF |tee "$HOME"/.local/share/applications/topgrade.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=Topgrade
Exec=gnome-terminal --title="Topgrade" --geometry=80x24 -- bash -c "topgrade; echo 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=aptdaemon-update-cache
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF
	else
	cat <<EOF |tee "$HOME"/.local/share/applications/topgrade.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=Topgrade
Exec=xterm -T 'Topgrade' -fa 'Ubuntu Mono' -fs 11 -bg "#300a25" -fg white -e bash -c "topgrade; echo 'Pressione qualquer tecla para fechar...'; read -n1"
Icon=aptdaemon-update-cache
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF
fi

mkdir -p "$HOME"/.local/bin
cat <<EOF |tee "$HOME"/.local/bin/search-app>/dev/null
#!/bin/bash

# Cores
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
NC="\033[0m" # Reset

if [ -z "\$1" ]; then
  echo -e "\${YELLOW}Uso: \$0 nome_do_programa\${NC}"
  exit 1
fi

prog="\$1"
echo -e "🔍 Procurando por: \${GREEN}\$prog\${NC}"

echo -e "\n📦 \${YELLOW}APT\${NC}:"
apt-cache pkgnames | grep -i "^\$prog" | while read -r pkg; do
  version=\$(apt-cache show "\$pkg" 2>/dev/null | grep -m1 '^Version:' | awk '{print \$2}')
  echo -e "\${GREEN}\$pkg\${NC} - versão: \$version"
done || echo -e "\${GREEN}Nenhum resultado.\${NC}"

echo -e "\n📦 \${YELLOW}AM\${NC}:"
am_result=\$(am -q "\$prog" 2>/dev/null | grep -i "\$prog")
[[ -n "\$am_result" ]] && echo -e "\${am_result}" || echo -e "\${GREEN}Nenhum resultado.\${NC}"

echo -e "\n📦 \${YELLOW}Pacstall\${NC}:"
pac_result=\$(pacstall -S "\$prog" 2>/dev/null | grep -i "\$prog")
[[ -n "\$pac_result" ]] && echo -e "\${pac_result}" || echo -e "\${GREEN}Nenhum resultado.\${NC}"
EOF
chmod +x "$HOME"/.local/bin/search-app