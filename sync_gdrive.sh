#!/bin/bash

# Configurações
# Carrega as configurações do arquivo .env
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "Erro: Arquivo .env não encontrado. Copie o .env.example para .env e preencha as variáveis."
    exit 1
fi

echo "Iniciando a sincronização do Google Drive ($REMOTE_NAME:$REMOTE_PATH) para $LOCAL_PATH via Docker..."

# Verifica se o diretório de destino existe localmente; se não, cria para evitar erros de permissão de montagem
mkdir -p "$LOCAL_PATH"

# Comando para rodar o rclone via Docker Compose
# Para sincronizar (deletando arquivos que não existem mais no drive), troque "copy" por "sync"
docker compose run --rm rclone copy "$REMOTE_NAME:$REMOTE_PATH" "$LOCAL_PATH" -v --stats=5s

echo "Sincronização concluída!"
