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
sudo apt install -y bat #batcat

## Dropbear
sudo apt install -y dropbear openssh-sftp-server

## FD
sudo apt install -y fd-find #fdfind

## FDupes
sudo apt install -y fdupes

## fzf
sudo apt install -y fzf #Ctrl+R
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
sudo apt install -y fonts-powerline liquidprompt
cp /usr/share/liquidprompt/liquidpromptrc-dist "$HOME"/.config/liquidpromptrc
sed -i 's/debian.theme/powerline.theme/' "$HOME"/.config/liquidpromptrc
set_bashrc
cat <<EOF |tee "$HOME"/.bashrc.d/liquidprompt.sh>/dev/null
printf \$- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt
lp_theme powerline
EOF

## LSD
sudo apt install -y lsd
#cd /tmp
#rm -f /tmp/*.tar.xz
#wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Ubuntu.tar.xz
#mkdir -p "$HOME"/.fonts/Nerd\ Fonts/Ubuntu
#tar -xf Ubuntu.tar.xz -C "$HOME"/.fonts/Nerd\ Fonts/Ubuntu
LANGUAGE=en pacstall -IP nerd-fonts:ttf-ubuntu-nerd

## Micro
sudo apt install -y micro