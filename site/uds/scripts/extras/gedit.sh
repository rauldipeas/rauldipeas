#!/bin/bash
set -e
#LN=''
#SWMC=''
#TARGET="$()"
#EXEC_OLD=''
#EXEC_NEW=''
#ICON_OLD=''
#ICON_NEW=''
#DEPS=''
#PPA=''
INSTNAME='gedit-plugins'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
#fix_launcher
install_deb
#gedit gedit-common gedit-plugin-bookmarks gedit-plugin-bracket-completion gedit-plugin-character-map gedit-plugin-code-comment gedit-plugin-color-picker gedit-plugin-draw-spaces gedit-plugin-git gedit-plugin-join-lines gedit-plugin-multi-edit gedit-plugin-session-saver gedit-plugin-smart-spaces gedit-plugin-terminal gedit-plugin-text-size gedit-plugin-word-completion gedit-plugins gedit-plugins-common gir1.2-amtk-5 gir1.2-ggit-1.0 gir1.2-gtksource-300 gir1.2-gucharmap-2.90 gir1.2-tepl-6 libgedit-amtk-5-0 libgedit-amtk-5-common libgedit-gtksourceview-300-0 libgedit-gtksourceview-300-common libgit2-glib-1.0-0 libgucharmap-2-90-7 libtepl-6-4 libtepl-common
dconf reset -f /org/gnome/gedit
dconf write /org/gnome/gedit/plugins/active-plugins "['terminal', 'git', spell', 'sort', 'modelines', 'filebrowser', 'docinfo']"
dconf write /org/gnome/gedit/preferences/editor/editor-font "'Ubuntu Sans Mono 11'"
dconf write /org/gnome/gedit/preferences/editor/use-default-font false
dconf write /org/gnome/gedit/preferences/editor/scheme "'Yaru-dark'"
dconf write /org/gnome/gedit/preferences/editor/wrap-mode "'none'"
dconf write /org/gnome/gedit/preferences/ui/side-panel-visible true
