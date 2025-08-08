#!/bin/bash
set -e
WINEVERSION="9.0"
TkG="https://github.com/Kron4ek/Wine-Builds/releases/download/"$WINEVERSION"/wine-"$WINEVERSION"-staging-tkg-amd64.tar.xz"
cd /tmp
rm -fr /tmp/wine*tkg*
wget -q --show-progress "$TkG"
tar -xf wine*tkg*.tar.xz
rm -fr wine*tkg*.tar.xz "$HOME"/.local/share/wine-tkg
mv wine*tkg* "$HOME"/.local/share/wine-tkg
cat <<EOF |sudo tee /etc/profile.d/wine-tkg.sh>/dev/null
if [ -d "\$HOME"/.local/share/wine-tkg ] ; then
    	PATH="\$HOME/.local/share/wine-tkg/bin:\$PATH"
    	export WINEFSYNC=1
fi
EOF
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true|sudo debconf-set-selections
sudo apt install -y --reinstall cabextract ttf-mscorefonts-installer winbind winetricks
if [ -d "$HOME"/.wine ];then
	rm -f "$HOME"/.wine/dosdevices/*
	ln -fs "$HOME"/.wine/drive_c "$HOME"/.wine/dosdevices/c:
	ln -fs / "$HOME"/.wine/dosdevices/z:	
fi
winetricks -f -q dxvk mfc42
#winetricks dwrite=disabled # (caractéres estranhos tipo árabe)
rm -fr\
	"$HOME"/.config/menus/applications-merged/wine*\
	"$HOME"/.local/share/applications/wine*\
	"$HOME"/.local/share/desktop-directories/wine*
find "$HOME"/.wine/drive_c/ -name "*.lnk" -exec wine $(find /usr/lib* -name winemenubuilder.exe|grep x86_64) '{}' \; 1>/dev/null
mkdir -p "$HOME"/.local/share/applications/wine/Programs
find "$HOME"/.local/share/applications/wine/Programs/ -name "*.desktop" -exec sed -i 's/wine-stable/wine/g' '{}' \; 1>/dev/null
find "$HOME/.config/menus" "$HOME/.local/share/applications/wine" "$HOME/.local/share/desktop-directories" \
  -type f \( \
    -iname '*agreement*' -o -iname '*changelog*' -o -iname '*chart*' -o -iname '*eula*' \
    -o -iname '*guide*' -o -iname '*manual*' -o -iname '*un-install*' -o -iname '*uninstall*' \
    -o -iname '*what*' \
  \) ! -iname '*revo*' -exec rm -frv {} +
find "$HOME"/.local/share/icons/hicolor/ -type f \( -iname "*.png" -o -iname "*.svg" \) -exec identify {} \; 2>&1\
	|grep -i error|cut -d '@' -f1|sed 's/.*header //g'\
	|sed 's/`//g'|sed 's/\ /\\ /g'|sed "s/'\\\//g"|xargs rm -frv
find "$HOME"/.local/share/applications/wine -type d -empty -delete