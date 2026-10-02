#!/bin/bash

# Configurações
REMOTE_NAME="gdrive"
REMOTE_PATH="pasta_compartilhada_no_drive" # Substitua pelo nome da pasta no seu Google Drive
LOCAL_PATH="_gdrive_raw/"

echo "Iniciando a sincronização do Google Drive ($REMOTE_NAME:$REMOTE_PATH) para $LOCAL_PATH via Docker..."

# Verifica se o diretório de destino existe localmente; se não, cria para evitar erros de permissão de montagem
mkdir -p "$LOCAL_PATH"

# Comando para rodar o rclone via Docker Compose
# Para sincronizar (deletando arquivos que não existem mais no drive), troque "copy" por "sync"
docker compose run --rm rclone copy "$REMOTE_NAME:$REMOTE_PATH" "$LOCAL_PATH" -v --stats=5s

echo "Sincronização concluída!"
