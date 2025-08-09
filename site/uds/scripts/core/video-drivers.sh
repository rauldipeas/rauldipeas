#!/bin/bash
set -e
gpu_info=$(lspci|grep -E "VGA|3D")
if printf "$gpu_info"|grep -q NVIDIA>/dev/null;then
	sudo dpkg --add-architecture i386
	sudo add-apt-repository -y ppa:graphics-drivers/ppa
	sudo apt update
	sudo apt install -y --reinstall libvulkan1 libvulkan1:i386
elif printf "$gpu_info"|grep -qE "AMD|Intel">/dev/null;then
	sudo dpkg --add-architecture i386
	sudo add-apt-repository -y ppa:kisak/kisak-mesa
	sudo apt upgrade -y
	sudo apt install -y --reinstall libgl1-mesa-dri libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386
	#cd /tmp
	#rm -f /tmp/*.deb
	#wget -q --show-progress "$(curl -s https://api.github.com/repos/Umio-Yasuno/amdgpu_top/releases|grep browser_download_url|grep amd64.deb|grep without_gui|head -n1|cut -d '"' -f4)"
	#sudo apt install -y --reinstall "$PWD"/amdgpu-top_without_gui*.deb
	#printf 'Hidden=true'|sudo tee /usr/share/applications/amdgpu_top.desktop>/dev/null
	#printf 'amdgpu'|sudo tee /etc/initramfs-tools/modules
fi