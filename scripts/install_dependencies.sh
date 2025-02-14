#!/bin/bash
# Script de instalação de todas as dependências do projeto

echo "🔧 Atualizando pacotes..."
sudo apt update

echo "📦 Instalando ferramentas essenciais..."
sudo apt install -y \
    git \
    curl \
    wget \
    unzip \
    docker.io \
    docker-compose \
    postgresql-client \
    jq \
    build-essential

echo "🐙 Instalando GitHub CLI..."
type -p gh >/dev/null || { 
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
    sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | \
    sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    sudo apt update && \
    sudo apt install gh -y; 
}

echo "✅ Instalação concluída!"
