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
INSTNAME='tilix'
source <(wget -qO- https://rauldipeas.com.br/uds/functions.sh)
#enter_tmp
#download
#fix_launcher
install_deb
gsettings set org.gnome.desktop.default-applications.terminal exec tilix
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper
dconf reset -f /com/gexperts/Tilix/
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/background-color "'#000036360D0D'"
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/background-transparency-percent 30
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/foreground-color "'#FFFFFFFFFFFF'"
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/login-shell true
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/terminal-bell "'none'"
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/use-theme-colors false