#!/bin/bash

# Configurações
ACCESS_TOKEN="$MASTODON_TOKEN" # Token de acesso à API do Mastodon
MASTODON_INSTANCE="https://mastodon.social" # Instância do Mastodon
USERNAME="raul_dipeas" # Nome de usuário
OUTPUT_DIR="_posts" # Diretório onde os arquivos markdown serão salvos

# Criar diretório para saída
mkdir -p "$OUTPUT_DIR"

# Obter o ID do usuário
USER_ID=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" \
  "$MASTODON_INSTANCE/api/v1/accounts/lookup?acct=$USERNAME" | jq -r '.id')

if [ -z "$USER_ID" ]; then
  echo "Não foi possível obter o ID do usuário. Verifique suas configurações."
  exit 1
fi

# Variável para paginação
MAX_ID=""

# Buscar as postagens do usuário
URL="$MASTODON_INSTANCE/api/v1/accounts/$USER_ID/statuses?limit=40"
POSTS=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "$URL")

# Processar cada postagem
echo "$POSTS" | jq -c '.[]' | while read -r POST; do
    # Ignorar postagens de resposta
    IN_REPLY_TO_ID=$(echo "$POST" | jq -r '.in_reply_to_id')
    if [ "$IN_REPLY_TO_ID" != "null" ]; then
      continue
    fi

    # Extrair informações da postagem
    CONTENT=$(echo "$POST" | jq -r '.content' | sed 's/<[^>]*>//g') # Remover tags HTML
    CREATED_AT=$(echo "$POST" | jq -r '.created_at' | sed 's/T.*//') # Data
    TIME=$(echo "$POST" | jq -r '.created_at' | sed 's/.*T\(.*\)Z/\1/') # Hora
    ID=$(echo "$POST" | jq -r '.id') # ID da postagem

    # Determinar título a partir da primeira linha do conteúdo
    TITLE=$(echo "$CONTENT" | sed 's/^\s*//;s/\s*$//' | awk 'BEGIN{RS="";}{print $1; exit}' | sed 's/#.*//' | sed 's/\\/\//g')

    # Verificar se a postagem tem mídia (imagem ou vídeo)
    MEDIA_URL=""
    VIDEO_URL=""
    if [ "$(echo "$POST" | jq -r '.media_attachments | length')" -gt 0 ]; then
      MEDIA_URL=$(echo "$POST" | jq -r '.media_attachments[0].url')
      MEDIA_TYPE=$(echo "$POST" | jq -r '.media_attachments[0].type')

      # Se for um vídeo, pegar o URL do vídeo e extrair um frame
      if [ "$MEDIA_TYPE" == "video" ]; then
        VIDEO_URL=$(echo "$POST" | jq -r '.media_attachments[0].remote_url')

        # Usar ffmpeg para pegar um frame central do vídeo (se o ffmpeg estiver disponível)
        if command -v ffmpeg &> /dev/null; then
          TEMP_VIDEO_FILE="video_$ID.mp4"
          curl -o "$TEMP_VIDEO_FILE" "$VIDEO_URL"

          # Extrair um frame no meio do vídeo
          VIDEO_FRAME="frame_${ID}.jpg"
          ffmpeg -i "$TEMP_VIDEO_FILE" -vf "select='eq(n\,0)'" -vsync vfr -q:v 2 "$VIDEO_FRAME"
          rm "$TEMP_VIDEO_FILE"

          MEDIA_URL="$VIDEO_FRAME"
        fi
      fi
    fi

    # Gerar arquivo Markdown
    FILENAME="$OUTPUT_DIR/$CREATED_AT-$ID.md"
    echo "---" > "$FILENAME"
    echo "title: \"$TITLE\"" >> "$FILENAME"
    echo "date: $CREATED_AT $TIME" >> "$FILENAME"

    # Adicionar imagem de capa (se houver)
    if [ -n "$MEDIA_URL" ]; then
      echo "image: /$MEDIA_URL" >> "$FILENAME"
    fi

    echo "---" >> "$FILENAME"
    echo "$CONTENT" >> "$FILENAME"

    echo "Postagem $ID salva em $FILENAME."
done

echo "Sincronização concluída!"