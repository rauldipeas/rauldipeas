#!/bin/bash
set -e
gei() {
    ID="$1"
    SHELL_VER=$(gnome-shell --version|awk '{print $3}')
    EXT_INFO=$(wget -qO- "https://extensions.gnome.org/extension-info/?pk=$ID&shell_version=$SHELL_VER")
    UUID=$(echo "$EXT_INFO"|jq -r .uuid)
    DOWNLOAD_URL=$(echo "$EXT_INFO"|jq -r .download_url)
    [ -z "$UUID" ]||[ "$DOWNLOAD_URL" = "null" ] && {
        echo "Falha ao obter UUID ou URL. Verifique se a extensão suporta GNOME $SHELL_VER."
        return 1
    }
    FULL_URL="https://extensions.gnome.org$DOWNLOAD_URL"
    TMPFILE=$(mktemp)
    wget -q --show-progress -O "$TMPFILE" "$FULL_URL"||{
        echo "Falha no download."
        return 1
    }
    gnome-extensions install -f "$TMPFILE"&&\
    echo "Extensão instalada: $UUID"
    rm -f "$TMPFILE"
}

## Bibata mouse cursor
sudo apt install -y bibata-cursor-theme dmz-cursor-theme
sudo update-alternatives --set x-cursor-theme /usr/share/icons/DMZ-White/cursor.theme #fallback
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice

## GNOME shell
sudo apt install -y\
    gnome-shell-extension-alphabetical-grid\
    gnome-shell-extension-prefs
dconf reset -f /org/gnome/shell/extensions/appindicator
dconf reset -f /org/gnome/shell/extensions/dash-to-dock
dconf reset -f /org/gnome/shell/extensions/ding
dconf reset -f /org/gnome/shell/extensions/tiling-assistant
gsettings set org.gnome.shell.extensions.dash-to-dock click-action minimize
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button false
gsettings set org.gnome.shell.extensions.dash-to-dock show-icons-notifications-counter false
gsettings set org.gnome.shell.extensions.ding keep-arranged true
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding start-corner top-right
dconf write /org/gnome/shell/extensions/alphabetical-app-grid/sort-folder-contents false
dconf write /org/gnome/shell/extensions/app-hider/hidden-apps "['display-im6.q16.desktop', 'micro.desktop', 'RealTimeSync.desktop', 'syncthing-start.desktop', 'syncthing-ui.desktop', 'debian-uxterm.desktop', 'debian-xterm.desktop', 'winetricks.desktop', 'diodon.desktop', 'synaptic.desktop', 'superpaper.desktop']"
dconf write /org/gnome/shell/extensions/appindicator/custom-icons "[('vlc', 'vlc-panel', ''), ('deltachat-desktop', 'deltachat-tray', ''), ('rambox', 'rambox-indicator', ''), ('superpaper', 'preferences-desktop-display-randr', ''), ('Diodon', 'notes-panel', ''), ('QjackCtl', 'gnome-device-manager', ''), ('rclone-browser', 'cloudstatus', ''), ('2wydifuftb', 'gtk-dialog-authentication-panel', ''), ('un-reboot', 'system-reboot-symbolic', ''), ('q4wine', 'folder-white-wine', '')]"
dconf reset -f /org/gnome/shell/extensions/azwallpaper
dconf write /org/gnome/shell/extensions/azwallpaper/bing-download-directory "'/home/rauldipeas/Imagens/Bing Wallpapers'"
dconf write /org/gnome/shell/extensions/azwallpaper/bing-wallpaper-download true
dconf write /org/gnome/shell/extensions/azwallpaper/bing-wallpaper-market "'pt-BR'"
dconf write /org/gnome/shell/extensions/azwallpaper/bing-wallpaper-resolution "'1920x1080'"
dconf write /org/gnome/shell/extensions/azwallpaper/slideshow-directory "'/home/rauldipeas/Sync/Imagens/Papéis de parede'"
dconf write /org/gnome/shell/extensions/azwallpaper/slideshow-slide-duration "(0, 5, 0)"
dconf reset -f /org/gnome/shell/extensions/blur-my-shell
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/blur true
dconf write /org/gnome/shell/extensions/blur-my-shell/applications/whitelist "['com.mitchellh.ghostty', 'Code', 'Alacritty']"
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/override-background true
dconf write /org/gnome/shell/extensions/blur-my-shell/dash-to-dock/unblur-in-overview true
dconf write /org/gnome/shell/extensions/blur-my-shell/panel/override-background-dynamically true
dconf write /org/gnome/shell/extensions/blur-my-shell/pipelines "{'pipeline_default': {'name': <'Default'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000000'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>]>}, 'pipeline_default_rounded': {'name': <'Default rounded'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000001'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>, <{'type': <'corner'>, 'id': <'effect_000000000002'>, 'params': <{'radius': <10>}>}>]>}}"
dconf reset -f /org/gnome/shell/extensions/Logo-menu
dconf write /org/gnome/shell/extensions/Logo-menu/menu-button-icon-image 5
dconf write /org/gnome/shell/extensions/Logo-menu/menu-button-icon-size 22
dconf write /org/gnome/shell/extensions/Logo-menu/menu-button-terminal "'x-terminal-emulator'"
dconf write /org/gnome/shell/extensions/Logo-menu/show-activities-button true
dconf write /org/gnome/shell/extensions/Logo-menu/show-lockscreen true
dconf write /org/gnome/shell/extensions/Logo-menu/show-power-options true
dconf write /org/gnome/shell/extensions/Logo-menu/symbolic-icon true
dconf write /org/gnome/shell/extensions/status-area-horizontal-spacing/hpadding 4
dconf write /org/gnome/shell/extensions/syncthing-toggle/port 8080
dconf reset -f /org/gnome/shell/extensions/window-title-is-back
dconf write /org/gnome/shell/extensions/window-title-is-back/colored-icon true
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.nautilus.icon-view default-zoom-level small-plus
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 'uint32 3700'
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'librewolf.desktop', 'deltachat-desktop.desktop', 'reaper-AM.desktop', 'com.blackmagicdesign.resolve.desktop', 'gimp.desktop', 'freetube.desktop']"
#dconf reset -f /org/gnome/TextEditor
#gsettings set org.gnome.TextEditor highlight-current-line true
#gsettings set org.gnome.TextEditor show-line-numbers true
#gsettings set org.gnome.TextEditor show-map true
#gsettings set org.gnome.TextEditor spellcheck false
#gsettings set org.gnome.TextEditor wrap-text false
gei 5895 # app-hider
gei 3193 # blur-my-shell
gei 1319 # gsconnect
gei 4451 # logo-menu
gei 355  # status-area-horizontal-spacing
gei 7180 # syncthing-toggle
gei 19   # user-themes
gei 6281 # wallpaper-slideshow
gei 6343 # window-gestures
gei 6310 # window-title-is-back
cat <<EOF |tee "$HOME"/.local/bin/enable-extensions>/dev/null
#!/bin/bash
for ext in \$(gnome-extensions list); do
  gnome-extensions enable "\$ext"
done
rm "\$HOME"/.config/autostart/enable-extensions.desktop "\$HOME"/.local/bin/enable-extensions
EOF
cat <<EOF |tee "$HOME"/.config/autostart/enable-extensions.desktop>/dev/null
[Desktop Entry]
Type=Application
Name=Ativar extensões do GNOME
Exec=bash $HOME/.local/bin/enable-extensions
Icon=org.gnome.Shell.Extensions
Terminal=false
Categories=System;Utility;
StartupNotify=true
EOF

## Papirus icon theme
sudo add-apt-repository -y ppa:papirus/papirus
sudo apt install -y papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
papirus-folders -C paleorange