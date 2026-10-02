#!/bin/bash

echo "Iniciando a instalação do Docker e Docker Compose no Ubuntu..."

# 1. Atualiza os pacotes e instala as dependências necessárias
echo "[1/5] Instalando pacotes pré-requisitos..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# 2. Adiciona a chave GPG oficial do Docker
echo "[2/5] Adicionando chave GPG oficial do Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 3. Adiciona o repositório do Docker às fontes do APT
echo "[3/5] Adicionando repositório do Docker..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Instala o Docker Engine e o Docker Compose
echo "[4/5] Instalando Docker e Docker Compose..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 5. Adiciona o usuário atual ao grupo 'docker' (para não precisar usar sudo toda vez)
echo "[5/5] Adicionando seu usuário ($USER) ao grupo 'docker'..."
sudo usermod -aG docker $USER

echo "================================================================"
echo "Instalação concluída com sucesso!"
echo "Verificando as versões instaladas:"
docker --version
docker compose version
echo "================================================================"
echo "⚠️ ATENÇÃO: Para que as permissões do grupo 'docker' funcionem e você"
echo "não precise usar 'sudo docker', você deve SAIR DA SESSÃO e ENTRAR NOVAMENTE"
echo "(ou reiniciar o computador / rodar o comando: newgrp docker)."
