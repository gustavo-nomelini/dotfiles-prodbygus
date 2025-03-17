#!/bin/bash

# Este é o script principal de configuração para um Mac novo ou resetado
# Ele instala todas as dependências e configura os dotfiles automaticamente

set -e # O script para se algum comando falhar

echo "🚀 Iniciando a configuração completa do macOS..."
echo "⚠️  Este script irá instalar e configurar diversas ferramentas e aplicativos."
echo "    O processo pode levar até 30 minutos, dependendo da sua conexão."
echo ""
read -p "Pressione ENTER para continuar ou CTRL+C para cancelar..." 

# Verifica se o Xcode Command Line Tools está instalado
if ! xcode-select -p &> /dev/null; then
  echo "📦 Instalando Xcode Command Line Tools..."
  xcode-select --install
  echo "⚠️  Por favor, aguarde a instalação do Xcode Command Line Tools terminar e pressione ENTER"
  read -p "Pressione ENTER quando a instalação estiver concluída..."
fi

# Instalar o Homebrew se não estiver instalado
if ! command -v brew &> /dev/null; then
  echo "🍺 Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Adicionar Homebrew ao PATH
  if [[ $(uname -m) == 'arm64' ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/usr/local/bin/brew shellenv)"
  fi
else
  echo "✓ Homebrew já está instalado."
  brew update
fi

# Instalar pacotes essenciais
echo "📦 Instalando pacotes essenciais via Homebrew..."
brew install git zsh curl wget fzf bat eza zoxide fd ripgrep thefuck yazi neovim node python3

# Instalar tema Powerlevel10k
echo "🎨 Instalando Powerlevel10k..."
brew install romkatv/powerlevel10k/powerlevel10k

# Instalar plugins para ZSH
echo "🔌 Instalando plugins ZSH..."
brew install zsh-autosuggestions zsh-syntax-highlighting

# Criar diretório de projetos e clonar repositório
echo "📂 Clonando repositório de dotfiles..."
mkdir -p ~/Projects
if [ ! -d ~/Projects/dotfiles-prodbygus ]; then
  git clone https://github.com/gustavo-nomelini/dotfiles-prodbygus.git ~/Projects/dotfiles-prodbygus
else
  echo "✓ Repositório já existe. Atualizando..."
  cd ~/Projects/dotfiles-prodbygus
  git pull
fi

cd ~/Projects/dotfiles-prodbygus

# Executar script de instalação dos dotfiles
echo "🔗 Instalando dotfiles..."
chmod +x install.sh
./install.sh

# Instalar aplicativos via Homebrew Cask
echo "📱 Instalando aplicativos..."
brew install --cask rectangle iterm2 wezterm warp raycast alt-tab karabiner-elements
brew install --cask google-chrome arc
brew install --cask visual-studio-code docker insomnia postman figma
brew install --cask slack discord
brew install --cask spotify notion

# Instalar Node Version Manager (NVM)
echo "📦 Instalando NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Instalar RBENV
echo "💎 Instalando RBENV..."
brew install rbenv ruby-build
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

# Instalar fontes
echo "🔠 Instalando fontes..."
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Criar arquivo de tokens
echo "🔒 Criando arquivo de tokens..."
if [ ! -f ~/.tokens ]; then
  touch ~/.tokens
  chmod 600 ~/.tokens
  echo '# Armazene seus tokens aqui de forma segura' > ~/.tokens
  echo '# exemplo: export GITHUB_TOKEN="seu_token_aqui"' >> ~/.tokens
fi

# Configurar ambiente de desenvolvimento web
echo "🌐 Configurando ambiente de desenvolvimento web..."
chmod +x scripts/setup-web-dev.sh
./scripts/setup-web-dev.sh

echo ""
echo "✅ Configuração completa concluída com sucesso!"
echo ""
echo "🔄 Por favor, reinicie seu terminal ou execute 'source ~/.zshrc'"
echo "⚙️  Execute 'p10k configure' para configurar o tema Powerlevel10k"
echo ""
echo "📝 Próximos passos recomendados:"
echo "  1. Configure o Karabiner-Elements para a tecla Hyperkey"
echo "  2. Configure suas credenciais git com 'git config --global user.name/email'"
echo "  3. Adicione seus tokens ao arquivo ~/.tokens"
echo "  4. Instale versões do Node com 'nvm install --lts'"
echo ""
echo "🎉 Aproveite seu Mac recém-configurado!"
