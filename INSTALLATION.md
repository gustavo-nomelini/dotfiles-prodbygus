# Guia Detalhado de Instalação

Este documento detalha o processo de instalação e configuração dos dotfiles em diferentes cenários.

## 📋 Cenários de Instalação

### 1. Mac Novo ou Após Reset de Fábrica

Recomendado: Use o script de instalação completa.

```bash
# 1. Baixar o script
curl -fsSL https://raw.githubusercontent.com/gustavo-nomelini/dotfiles-prodbygus/main/setup_mac.sh -o setup_mac.sh

# 2. Tornar executável e executar
chmod +x setup_mac.sh
./setup_mac.sh
```

Este script única instalará todo o ambiente necessário, incluindo:
- Homebrew e pacotes essenciais
- Repositório de dotfiles
- ZSH e Powerlevel10k
- Apps como VS Code, Chrome, etc.
- Ferramentas de desenvolvimento

### 2. Mac Existente (Atualização dos Dotfiles)

Se você já tem o ambiente configurado e deseja apenas atualizar os dotfiles:

```bash
# Atualizar o repositório
cd ~/Projects/dotfiles-prodbygus
git pull

# Reinstalar os dotfiles
./install.sh
```

### 3. Configuração Manual (Passo a Passo)

Se preferir mais controle sobre o que está sendo instalado:

```bash
# 1. Instalar Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"  # Para Apple Silicon

# 2. Instalar pacotes essenciais
brew install git zsh curl wget fzf bat eza zoxide fd ripgrep thefuck yazi neovim

# 3. Clonar o repositório
mkdir -p ~/Projects
git clone https://github.com/gustavo-nomelini/dotfiles-prodbygus.git ~/Projects/dotfiles-prodbygus
cd ~/Projects/dotfiles-prodbygus

# 4. Instalar dotfiles
./install.sh

# 5. Instalar ambiente de desenvolvimento web (opcional)
./scripts/setup-web-dev.sh
```

## 🛠️ Entendendo os Scripts

### `setup_mac.sh`

O script principal de bootstrap. Este é o único script que você precisa executar em um Mac novo ou resetado. Ele:
- Instala todas as dependências necessárias
- Configura o ambiente de desenvolvimento
- Instala aplicativos essenciais
- Configura dotfiles

### `install.sh`

Este script apenas cria links simbólicos dos dotfiles para os locais adequados. Execute-o quando:
- Você já tem o repositório clonado e só quer atualizar os links
- Você modificou algum arquivo de configuração e quer aplicá-lo

### `setup_dirs.sh`

Este script é usado para reorganizar a estrutura de diretórios do repositório. Você raramente precisará executá-lo, a menos que esteja contribuindo com o projeto.

### `scripts/setup-web-dev.sh`

Configura um ambiente completo para desenvolvimento web com:
- Instalação de pacotes Node globais (TypeScript, React, etc.)
- Configuração de extensões do VS Code
- Configuração de ESLint, Prettier, etc.

## 🔄 Manutenção Contínua

Após a instalação inicial, mantenha seu sistema atualizado com:

```bash
# Atualização completa do sistema (Homebrew, NPM, etc.)
update-system

# Ou use o alias mais curto
update
```

## 🔧 Solução de Problemas

Se encontrar problemas durante a instalação:

1. **Erro de permissão**: Verifique se executou o script com as permissões corretas (`chmod +x`)
2. **Homebrew não instalado**: Execute manualmente o comando de instalação do Homebrew
3. **Link simbólico falhou**: Execute `./install.sh` novamente
4. **Problema com NVM**: Tente instalar o NVM manualmente conforme documentação oficial

Para problemas persistentes, crie uma issue no repositório GitHub.
