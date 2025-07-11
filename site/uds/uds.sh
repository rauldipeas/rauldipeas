#!/bin/bash
set -e

declare -a entries=(
  # Deps
  "🧰 Dependências" "scripts/deps/postinst-deps.sh" "Ferramentas para este script"
  "🎛️ Ganchos do APT" "scripts/deps/apt-hooks.sh" "Configurações para o APT"
  "📦 UnSnap" "scripts/deps/unsnap-fresh-ubuntu.sh" "Remover o Snap"

  # Core
  "🧠 Liquorix" "scripts/core/liquorix.sh" "Kernel"
  "📺 Drivers de vídeo" "scripts/core/video-drivers.sh" "Drivers de vídeo"
  "🎙️ Ubuntu Studio" "scripts/core/ubuntustudio.sh" "Configurações do sistema"
  "☑️ RTCQS" "scripts/core/rtcqs.sh" "Verificador de configurações"

  # Sources
  "📦 Fontes de programas" "scripts/sources/software-sources.sh" "Fontes de programas"
  "📦 XtraDeb" "scripts/sources/xtradeb.sh" "Repositório de programas"
  "📦 Flatpak" "scripts/sources/flatpak.sh" "Flatpak"
  "📦 Synaptic" "scripts/sources/synaptic.sh" "Gerenciador de pacotes Debian"

  # Audio
  "🎵 MuseScore" "scripts/audio/musescore-studio.sh" "Notação musical"
  "🎵 Reaper" "scripts/audio/reaper.sh" "DAW (Estação de trabalho de áudio)"
  "🎵 Tenacity" "scripts/audio/tenacity.sh" "Editor de áudio"
  "🎵 ArtV" "scripts/audio/artv.sh" "Plugins de áudio"
  "🎵 Auburn Sounds" "scripts/audio/auburnsounds.sh" "Plugins de áudio"
  "🎵 ChowDSP" "scripts/audio/chowdsp.sh" "Plugins de áudio"
  "🎵 LSP plugins" "scripts/audio/lsp-plugins.sh" "Plugins de áudio"
  "🎵 NeuralRack" "scripts/audio/neuralrack.sh" "Plugin de áudio"
  "🎵 Sfizz" "scripts/audio/sfizz.sh" "Tocador de amostras"
  "🎵 TheMasker" "scripts/audio/themasker.sh" "Plugin de áudio"
  "🎵 ToneLib" "scripts/audio/tonelib.sh" "Plugins de áudio"
  "🎵 ZL Audio" "scripts/audio/zl-audio.sh" "Plugins de áudio"
  "🎵 Q4WINE" "scripts/audio/q4wine.sh" "Utilitário do WINE"
  "🎵 WINE TkG" "scripts/audio/wine-tkg.sh" "WINE + patch FSync"
  "🎵 yabridge" "scripts/audio/yabridge.sh" "Ponte WINE-VST"

  # Video
  "🎥 OBS Studio" "scripts/video/obs-studio.sh" "Transmissão/gravação"
  "🎥 Iriun" "scripts/video/iriun.sh" "Webcam móvel"
  "🎥 DaVinci Resolve" "scripts/video/davinci-resolve.sh" "Editor de vídeo"
  "🎥 Shutter Encoder" "scripts/video/shutter-encoder.sh" "Conversor de mídia"
  "🎥 Blender" "scripts/video/blender.sh" "Editor 3D"
  "🎥 Natron" "scripts/video/natron.sh" "Composição"
  "🎥 Flowblade" "scripts/video/flowblade.sh" "Editor de vídeo"
  "🎥 Kdenlive" "scripts/video/kdenlive.sh" "Editor de vídeo"
  "🎥 Glaxnimate" "scripts/video/glaxnimate.sh" "Editor de animação"

  # Image
  "🖼️ GIMP" "scripts/image/gimp.sh" "Editor de imagem"

  # Extras
  "🌐 LibreWolf" "scripts/extras/librewolf.sh" "Navegador web"
  "🌐 FirefoxPWA" "scripts/extras/firefoxpwa.sh" "Aplicativos progressivos da web"
  "⬇️ FDM" "scripts/extras/freedownloadmanager.sh" "Gerenciador de downloads"
  "🔐 Proton Pass" "scripts/extras/proton-pass.sh" "Gerenciador de senhas"
  "🔐 Ente Auth" "scripts/extras/ente-auth.sh" "Gerador de 2FA"
  "🔃 Timeshift" "scripts/extras/timeshift.sh" "Backup"
  "☁️ MegaSync" "scripts/extras/megasync.sh" "Nuvem"
  "🔃 Syncthing" "scripts/extras/syncthing.sh" "Sincronização LAN"
  "💬 Keybase" "scripts/extras/keybase.sh" "Nuvem + chat criptografado"
  "🗃️ FreeFileSync" "scripts/extras/freefilesync.sh" "Sincronizador de pastas"
  "☁️ RClone" "scripts/extras/rclone.sh" "Nuvem"
  "📬 DeltaChat" "scripts/extras/deltachat.sh" "Email/chat criptografado"
  "💬 Rambox" "scripts/extras/rambox.sh" "Multi-mensageiro"
  "📬 Mailspring" "scripts/extras/mailspring.sh" "Cliente de email"
  "📺 FreeTube" "scripts/extras/freetube.sh" "Frontend para YouTube"
  "📺 Stremio" "scripts/extras/stremio.sh" "Streaming por torrent"
  "🎮 RetroArch" "scripts/extras/retroarch.sh" "Emulador de videogame"
  "🖥️ Tilix" "scripts/extras/tilix.sh" "Terminal tiling"
  "🖥️ CLI tools" "scripts/extras/cli-tools.sh" "Ferramentas de linha de comando"
  "🖥️ VirtualBox" "scripts/extras/virtualbox.sh" "Virtualização"
  "☎️ Rustdesk" "scripts/extras/rustdesk.sh" "Acesso remoto"
  "📓 Obsidian" "scripts/extras/obsidian.sh" "Gerenciador de notas markdown"
  "🖥️ VSCode" "scripts/extras/vscode.sh" "IDE para programação"
  "🎨 Temas" "scripts/extras/themes.sh" "Temas visuais"
  "🖼️ Superpaper" "scripts/extras/superpaper.sh" "Papel de parede em slideshow"
  "📋 Diodon" "scripts/extras/diodon.sh" "Gerenciador da área de transferência"
  "📆 GNOME Calendar" "scripts/extras/gnome-calendar.sh" "Calendário"
  "🌤️ GNOME Weather" "scripts/extras/gnome-weather.sh" "Clima"
  "📦 PeaZip" "scripts/extras/peazip.sh" "Arquivos compactados"
  "📖 Dialect" "scripts/extras/dialect.sh" "Tradutor de texto"
  "🔧 Ubuntu Pro" "scripts/extras/ubuntu-pro.sh" "Serviços Ubuntu Pro"
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
      script_url="https://rauldipeas.com.br/uds/$script_path"
      echo "Executando $nome..."
      xterm -T "$nome" -fa 'Monospace' -fs 11 -bg darkblue -fg white -e bash -c "bash <(wget -qO- $script_url); echo 'Pressione qualquer tecla para fechar...'; read -n1"
    fi
  done
done

#zenity --question --text="Deseja reiniciar agora?" && sudo shutdown -r now
