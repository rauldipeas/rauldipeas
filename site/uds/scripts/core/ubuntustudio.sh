#!/bin/bash
set -e
DEPS="nohang\
	ubuntustudio-lowlatency-settings\
	ubuntustudio-performance-tweaks\
	ubuntustudio-pipewire-config"
PPA='savoury1/multimedia'
INSTNAME='helvum'
source <(curl -s https://rauldipeas.com.br/uds/functions.sh)
sudo debconf-set-selections <<< 'jackd2 jackd/tweak_rt_limits string true'
add_ppa
install_deb
sudo apt autoremove --purge -y qmidinet qpwgraph
sudo usermod -aG audio,pipewire "$USER"
sudo wget -q --show-progress -O /etc/udev/rules.d/99-cpu-dma-latency.rules https://github.com/Ardour/ardour/raw/refs/heads/master/tools/udev/99-cpu-dma-latency.rules>/dev/null
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo sed -i 's/ nosmt=force//g' /etc/default/grub.d/ubuntustudio.cfg
sudo sed -i 's/threadirqs/threadirqs nosmt=force/g' /etc/default/grub.d/ubuntustudio.cfg
sudo update-grub
mkdir -p "$HOME"/.config/rncbc.org
wget -q --show-progress -O "$HOME"/.config/rncbc.org/QjackCtl.conf https://rauldipeas.com.br/uds/settings/QjackCtl.conf
mkdir -p "$HOME"/.config/pipewire/pipewire.conf.d
export QOPT=128
export ROPT=44100
curl -s https://rauldipeas.com.br/uds/settings/99-custom.conf|envsubst|tee "$HOME"/.config/pipewire/pipewire.conf.d/99-custom.conf>/dev/null
systemctl --user restart pipewire pipewire-pulse
sudo mkdir -p /usr/local/{bin,share/applications}
sudo wget -q --show-progress -O /usr/local/bin/pipewire-latency-switcher https://rauldipeas.com.br/uds/settings/pipewire-latency-switcher
sudo chmod +x /usr/local/bin/pipewire-latency-switcher
sudo wget -q --show-progress -O /usr/local/share/applications/pipewire-latency-switcher.desktop https://rauldipeas.com.br/uds/settings/pipewire-latency-switcher.desktop
if [ "$(gsettings get org.gnome.desktop.interface icon-theme)" == "'Papirus-Dark'" ];then
	sudo sed -i 's/audio-speakers/hifi' /usr/local/share/applications/pipewire-latency-switcher.desktop
fi
sudo wget -q --show-progress -O /usr/local/bin/toggle-pipewire-jack https://rauldipeas.com.br/uds/settings/toggle-pipewire-jack
sudo chmod +x /usr/local/bin/toggle-pipewire-jack
mkdir -p "$HOME"/.config/nohang
cat <<EOF |tee "$HOME"/.config/nohang/nohang.conf>/dev/null
notify_every = 60       # intervalo entre notificações (em segundos)
min_notify_mem = 200    # memória livre mínima antes de notificar (em MiB)
EOF