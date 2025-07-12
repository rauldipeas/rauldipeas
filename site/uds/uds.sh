#!/bin/bash
set -e

declare -a entries=(
  # Deps
  "🧰 Dependências" "deps/postinst-deps.sh" "Ferramentas para este script"
  "🎛️ Ganchos do APT" "deps/apt-hooks.sh" "Configurações para o APT"
  "📦 UnSnap" "deps/unsnap-fresh-ubuntu.sh" "Remover o Snap"

  # Core
  "🧠 Liquorix" "core/liquorix.sh" "Kernel"
  "📺 Drivers de vídeo" "core/video-drivers.sh" "Drivers de vídeo"
  "🎙️ Ubuntu Studio" "core/ubuntustudio.sh" "Configurações do sistema"
  "☑️ RTCQS" "core/rtcqs.sh" "Verificador de configurações"

  # Sources
  "📦 Fontes de programas" "sources/software-sources.sh" "Fontes de programas"
  "📦 XtraDeb" "sources/xtradeb.sh" "Repositório de programas"
  "📦 Flatpak" "sources/flatpak.sh" "Flatpak"
  "📦 Synaptic" "sources/synaptic.sh" "Gerenciador de pacotes Debian"

  # Audio
  "🎵 MuseScore" "audio/musescore-studio.sh" "Notação musical"
  "🎵 Reaper" "audio/reaper.sh" "DAW (Estação de trabalho de áudio)"
  "🎵 Tenacity" "audio/tenacity.sh" "Editor de áudio"
  "🎵 ArtV" "audio/artv.sh" "Plugins de áudio"
  "🎵 Auburn Sounds" "audio/auburnsounds.sh" "Plugins de áudio"
  "🎵 ChowDSP" "audio/chowdsp.sh" "Plugins de áudio"
  "🎵 LSP plugins" "audio/lsp-plugins.sh" "Plugins de áudio"
  "🎵 NeuralRack" "audio/neuralrack.sh" "Plugin de áudio"
  "🎵 Sfizz" "audio/sfizz.sh" "Tocador de amostras"
  "🎵 TheMasker" "audio/themasker.sh" "Plugin de áudio"
  "🎵 ToneLib" "audio/tonelib.sh" "Plugins de áudio"
  "🎵 ZL Audio" "audio/zl-audio.sh" "Plugins de áudio"
  "🎵 Q4WINE" "audio/q4wine.sh" "Utilitário do WINE"
  "🎵 WINE TkG" "audio/wine-tkg.sh" "WINE + patch FSync"
  "🎵 yabridge" "audio/yabridge.sh" "Ponte WINE-VST"

  # Video
  "🎥 OBS Studio" "video/obs-studio.sh" "Transmissão/gravação"
  "🎥 Iriun" "video/iriun.sh" "Webcam móvel"
  "🎥 DaVinci Resolve" "video/davinci-resolve.sh" "Editor de vídeo"
  "🎥 Shutter Encoder" "video/shutter-encoder.sh" "Conversor de mídia"
  "🎥 Blender" "video/blender.sh" "Editor 3D"
  "🎥 Natron" "video/natron.sh" "Composição"
  "🎥 Flowblade" "video/flowblade.sh" "Editor de vídeo"
  "🎥 Kdenlive" "video/kdenlive.sh" "Editor de vídeo"
  "🎥 Glaxnimate" "video/glaxnimate.sh" "Editor de animação"

  # Image
  "🖼️ GIMP" "image/gimp.sh" "Editor de imagem"

  # Extras
  "🌐 LibreWolf" "extras/librewolf.sh" "Navegador web"
  "🌐 FirefoxPWA" "extras/firefoxpwa.sh" "Aplicativos progressivos da web"
  "⬇️ FDM" "extras/freedownloadmanager.sh" "Gerenciador de downloads"
  "🔐 Proton Pass" "extras/proton-pass.sh" "Gerenciador de senhas"
  "🔐 Ente Auth" "extras/ente-auth.sh" "Gerador de 2FA"
  "🔃 Timeshift" "extras/timeshift.sh" "Backup"
  "☁️ MegaSync" "extras/megasync.sh" "Nuvem"
  "🔃 Syncthing" "extras/syncthing.sh" "Sincronização LAN"
  "💬 Keybase" "extras/keybase.sh" "Nuvem + chat criptografado"
  "🗃️ FreeFileSync" "extras/freefilesync.sh" "Sincronizador de pastas"
  "☁️ RClone" "extras/rclone.sh" "Nuvem"
  "📬 DeltaChat" "extras/deltachat.sh" "Email/chat criptografado"
  "💬 Rambox" "extras/rambox.sh" "Multi-mensageiro"
  "📬 Mailspring" "extras/mailspring.sh" "Cliente de email"
  "📺 FreeTube" "extras/freetube.sh" "Frontend para YouTube"
  "📺 Stremio" "extras/stremio.sh" "Streaming por torrent"
  "🎮 RetroArch" "extras/retroarch.sh" "Emulador de videogame"
  "🖥️ Tilix" "extras/tilix.sh" "Terminal tiling"
  "🖥️ CLI tools" "extras/cli-tools.sh" "Ferramentas de linha de comando"
  "🖥️ VirtualBox" "extras/virtualbox.sh" "Virtualização"
  "☎️ Rustdesk" "extras/rustdesk.sh" "Acesso remoto"
  "📓 Obsidian" "extras/obsidian.sh" "Gerenciador de notas markdown"
  "🖥️ VSCode" "extras/vscode.sh" "IDE para programação"
  "🎨 Temas" "extras/themes.sh" "Temas visuais"
  "🖼️ Superpaper" "extras/superpaper.sh" "Papel de parede em slideshow"
  "📋 Diodon" "extras/diodon.sh" "Gerenciador da área de transferência"
  "📆 GNOME Calendar" "extras/gnome-calendar.sh" "Calendário"
  "🌤️ GNOME Weather" "extras/gnome-weather.sh" "Clima"
  "📦 PeaZip" "extras/peazip.sh" "Arquivos compactados"
  "📖 Dialect" "extras/dialect.sh" "Tradutor de texto"
  "🎨 Folder color" "extras/folder-color.sh" "Cores nas pastas"
  "🔧 Ubuntu Pro" "extras/ubuntu-pro.sh" "Serviços Ubuntu Pro"
)

options=()
for ((i=0; i<${#entries[@]}; i+=3)); do
  options+=("FALSE" "${entries[i]}" "${entries[i+2]}")
done

selected=$(zenity --list --checklist \
  --title="Pós-instalação Ubuntu (Estúdio)" --width=600 --height=600 \
  --column="Selecionar" --column="Nome" --column="Descrição" \
  "${options[@]}")

[[ -z "$selected" ]] && exit

IFS="|" read -ra sel_arr <<< "$selected"
for nome in "${sel_arr[@]}"; do
  # buscar o caminho correspondente
  for ((i=0; i<${#entries[@]}; i+=3)); do
    if [[ "${entries[i]}" == "$nome" ]]; then
      script_path="${entries[i+1]}"  # <- isso estava faltando
      script_url="https://rauldipeas.com.br/uds/scripts/$script_path"
      echo "Executando $nome..."
      xterm -T "$nome" -fa 'Monospace' -fs 11 -bg darkblue -fg white -e bash -c "bash <(wget -qO- '$script_url'); echo 'Pressione qualquer tecla para fechar...'; read -n1"
    fi
  done
done

#zenity --question --text="Deseja reiniciar agora?" && sudo shutdown -r now
