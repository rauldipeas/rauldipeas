#!/bin/bash
set -e
set_bashrc() {
  mkdir -p "$HOME"/.bashrc.d
  cp /etc/skel/.bashrc "$HOME"/.bashrc.d/default-bashrc.sh
  cat <<EOF |tee "$HOME"/.bashrc>/dev/null
if [ -d "\$HOME/.bashrc.d" ]; then
  for f in "\$HOME"/.bashrc.d/*.sh; do
    [ -r "\$f" ] && . "\$f"
  done
fi
EOF
}

## Bat
sudo apt install -y --reinstall bat #batcat

## Ble.sh
cd /tmp
rm -fr /tmp/ble.sh
git clone -q --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh
make -C ble.sh install PREFIX="$HOME"/.local
set_bashrc
cat <<EOF |tee "$HOME"/.bashrc.d/ble.sh>/dev/null
#source "$HOME"/.local/share/blesh/ble.sh --noattach
#[[ ! \${BLE_VERSION-} ]] || ble-attach
source -- "$HOME"/.local/share/blesh/ble.sh
EOF
cat <<EOF |tee "$HOME"/.blerc>/dev/null
# desabilita syntax highlighting
bleopt highlight_syntax=
# desabilita highlighting baseado em filenames
bleopt highlight_filename=
# desabilita highlighting baseado em tipos de variável
bleopt highlight_variable=
# desabilita ambiguous completion
bleopt complete_ambiguous=
# desabilita menu-complete com TAB
bleopt complete_menu_complete=
# desabilita menu filtering (ex.: sugerir arquivos)
bleopt complete_menu_filter=
# desabilita marcador de EOF (ex.: "[ble: EOF]")
bleopt prompt_eol_mark=''
# desabilita marcador de erro (ex.: "[ble: exit %d]")
bleopt exec_errexit_mark=
# desabilita marcador de exit (ex.: "[ble: exit]")
bleopt exec_exit_mark=
# desabilita outros marcadores (ex.: "[ble: ...]")
bleopt edit_marker=
bleopt edit_marker_error=
# deixa o auto-complete com uma cor mais sútil
ble-face auto_complete='fg=240,underline,italic'
EOF

## Dropbear
sudo apt install -y --reinstall dropbear openssh-sftp-server

## FD
sudo apt install -y --reinstall fd-find #fdfind

## FDupes
sudo apt install -y --reinstall fdupes

## fzf
sudo apt install -y --reinstall fzf #Ctrl+R
set_bashrc
cat <<EOF |tee "$HOME"/.bashrc.d/fzf-history.sh>/dev/null
export HISTTIMEFORMAT='%F %T '
__fzf_history() {
  selected=\$(history|tac|awk '!seen[\$0]++'|sed -E "s/^([ ]*[0-9]+[ ]+)([0-9-]+ [0-9:]+)/\1\x1b[38;5;43m\2\x1b[0m /"|fzf --ansi --expect=tab,enter \
    --prompt='Histórico > ' \
    --header='TAB: inserir  |  ENTER: executar' \
    --preview="printf {} | sed 's/^[ ]*[0-9]*[ ]*[0-9-]* [0-9:]*[ ]*//'" \
    --preview-window=down:1 \
    --height=100% --border)

  key=\$(head -n1 <<< "\$selected")
  cmd=\$(tail -n1 <<< "\$selected" | sed 's/^[ ]*[0-9]*[ ]*[0-9-]* [0-9:]*[ ]*//')

  if [[ \$key == enter ]]; then
    eval "\$cmd"
  elif [[ \$key == tab ]]; then
    READLINE_LINE="\$cmd"
    READLINE_POINT=\${#READLINE_LINE}
  fi
}
bind -x '"\C-r": __fzf_history'
EOF

## Liquid Prompt
sudo apt install -y --reinstall fonts-powerline liquidprompt
cp /usr/share/liquidprompt/liquidpromptrc-dist "$HOME"/.config/liquidpromptrc
sed -i 's/debian.theme/powerline.theme/' "$HOME"/.config/liquidpromptrc
set_bashrc
cat <<EOF |tee "$HOME"/.bashrc.d/liquidprompt.sh>/dev/null
printf \$- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt
lp_theme powerline
EOF
gsettings set org.gnome.desktop.interface monospace-font-name "'Ubuntu Mono 11'"

## LSD
sudo apt install -y --reinstall lsd
pacstall -IP nerd-fonts:ttf-ubuntu-nerd nerd-fonts:ttf-ubuntu-mono-nerd

## Micro
sudo apt install -y --reinstall micro
mkdir -p "$HOME"/.config/micro
cat <<EOF |tee "$HOME"/.config/micro/settings.json>/dev/null
{
    "eofnewline": false
}
EOF