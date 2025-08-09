#!/bin/bash
set -e
curl -s https://www.virtualbox.org/download/oracle_vbox_2016.asc|sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/virtualbox.gpg
printf "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"|sudo tee /etc/apt/sources.list.d/virtualbox.list>/dev/null
sudo apt update
sudo apt install -y --reinstall "$(apt-cache search ^virtualbox|grep virtualbox|grep "\-[0-9]\."|tail -n1|cut -d ' ' -f1)"
sudo usermod -aG vboxusers "$USER"
#sudo rmmod kvm_amd
#sudo rmmod kvm
#sudo modprobe kvm
#sudo modprobe kvm_amd