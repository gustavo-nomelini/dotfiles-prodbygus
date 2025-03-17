#!/bin/bash

# Script para configurar um ambiente completo de desenvolvimento web
echo "🚀 Configurando ambiente de desenvolvimento web..."

# Instalar ferramentas globais
npm_packages=(
  "typescript" 
  "ts-node" 
  "create-react-app" 
  "create-next-app" 
  "@angular/cli"
  "eslint" 
  "prettier" 
  "prettier-plugin-tailwindcss"
  "@tailwindcss/language-server"
  "http-server"
  "json-server"
  "nodemon"
  "npm-check-updates"
  "depcheck"
  "serve"
  "vercel"
  "netlify-cli"
  "vite"
  "turbo"
  "nx"
)

echo "📦 Instalando pacotes npm globais..."
for package in "${npm_packages[@]}"; do
  echo "Instalando $package..."
  npm install -g $package
done

# Configurar VS Code
vscode_extensions=(
  "dbaeumer.vscode-eslint"
  "esbenp.prettier-vscode"
  "bradlc.vscode-tailwindcss"
  "formulahendry.auto-rename-tag"
  "dsznajder.es7-react-js-snippets"
  "mikestead.dotenv"
  "Christian-Kohler.npm-intellisense"
  "streetsidesoftware.code-spell-checker"
  "eamodio.gitlens"
  "usernamehw.errorlens"
  "pkief.material-icon-theme"
  "github.copilot"
  "styled-components.vscode-styled-components"
  "ms-azuretools.vscode-docker"
  "GraphQL.vscode-graphql"
  "ms-vscode-remote.remote-containers"
  "Prisma.prisma"
  "ms-vsliveshare.vsliveshare"
)

echo "🛠️  Instalando extensões VS Code..."
for extension in "${vscode_extensions[@]}"; do
  code --install-extension $extension
done

# Configurar Git global
echo "⚙️  Configurando Git templates..."
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global core.autocrlf input

# Copiar arquivos de configuração
echo "📝 Criando configurações padrão..."
if [ ! -f ~/.prettierrc ]; then
  cp ~/Projects/dotfiles-prodbygus/home/.prettierrc ~/
fi

if [ ! -f ~/.eslintrc ]; then
  cp ~/Projects/dotfiles-prodbygus/home/.eslintrc ~/
fi

# Configurar dir de templates para novos projetos
mkdir -p ~/Templates/react-ts
mkdir -p ~/Templates/next-ts

echo "✅ Configuração concluída com sucesso!"
echo ""
echo "🌟 Para criar um novo projeto:"
echo "  - Use 'create-web-project <nome> <tipo>'"
echo "  - Para projetos existentes, use 'tailwind-init' para configurar Tailwind"
echo "  - Use 'project-info' para analisar um projeto existente"
echo "  - Use 'clean-project' para limpar um projeto JavaScript/TypeScript"
