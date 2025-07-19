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
  "🎛️ Cable" "core/cable.sh" "Controle do PipeWire"
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
  "🎵 Audio Assault" "audio/audio-assault.sh" "Plugins de áudio"
  "🎵 Sfizz" "audio/sfizz.sh" "Tocador de amostras"
  "🎵 TheMasker" "audio/themasker.sh" "Plugin de áudio"
  "🎵 ToneLib" "audio/tonelib.sh" "Plugins de áudio"
  "🎵 ZL Audio" "audio/zl-audio.sh" "Plugins de áudio"
  "🎵 MX Tune" "audio/mx-tune.sh" "Plugin de áudio"
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
      if command -v alacritty>/dev/null;then
        alacritty --title "$nome" -o window.dimensions.columns=80 -o window.dimensions.lines=24 -e bash -c "bash <(wget -qO- '$script_url'); echo 'Pressione qualquer tecla para fechar...'; read -n1"
        else
        xterm -T "$nome" -fa 'Monospace' -fs 11 -bg "#300a25" -fg white -e bash -c "bash <(wget -qO- '$script_url'); echo 'Pressione qualquer tecla para fechar...'; read -n1"
      fi
    fi
  done
done

#zenity --question --text="Deseja reiniciar agora?" && sudo shutdown -r now