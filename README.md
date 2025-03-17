# dotfiles-prodbygus

Este repositório contém meus arquivos de configuração pessoal (dotfiles) e instruções para configurar um Mac novo do jeito que eu gosto.

## 🚀 Configuração Inicial do macOS

### Passo 1: Instalar o Homebrew

O [Homebrew](https://brew.sh) é um gerenciador de pacotes essencial para o macOS. Para instalá-lo, execute no Terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Passo 2: Adicionar o Homebrew ao PATH

Após a instalação do Homebrew, adicione-o ao seu PATH:

```bash
# Para Apple Silicon (M1/M2)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Para Intel Macs
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```

### Passo 3: Instalar pacotes essenciais

Instale os pacotes básicos necessários para a configuração:

```bash
# Ferramentas essenciais
brew install git zsh curl wget

# Ferramentas de produtividade
brew install fzf bat eza zoxide fd ripgrep thefuck yazi

# Ferramentas de desenvolvimento
brew install neovim node python3
```

### Passo 4: Configurar o Oh My Zsh com Powerlevel10k

Instale o Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Instale o tema Powerlevel10k:

```bash
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
```

Configure o Powerlevel10k:

```bash
p10k configure
```

### Passo 5: Instalar plugins para o ZSH

```bash
# Instalar plugins
brew install zsh-autosuggestions zsh-syntax-highlighting

# Adicionar ao .zshrc
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

### Passo 6: Clonar este repositório de dotfiles

```bash
mkdir -p ~/Projects
git clone https://github.com/gustavo-nomelini/dotfiles-prodbygus.git ~/Projects/dotfiles-prodbygus
cd ~/Projects/dotfiles-prodbygus
```

### Passo 7: Criar links simbólicos para os dotfiles

```bash
# Backup dos arquivos existentes
mkdir -p ~/dotfiles_backup
[ -f ~/.zshrc ] && mv ~/.zshrc ~/dotfiles_backup/.zshrc_backup
[ -f ~/.wezterm.lua ] && mv ~/.wezterm.lua ~/dotfiles_backup/.wezterm.lua_backup
[ -d ~/.hammerspoon ] && mv ~/.hammerspoon ~/dotfiles_backup/.hammerspoon_backup
[ -d ~/.config/warp ] && mv ~/.config/warp ~/dotfiles_backup/warp_backup

# Criar diretórios de configuração necessários
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/.config/warp/themes
mkdir -p ~/.config/warp/launch_configurations
mkdir -p ~/.config/wezterm

# Criar links simbólicos para arquivos na HOME
ln -sf ~/Projects/dotfiles-prodbygus/home/.zshrc ~/.zshrc
ln -sf ~/Projects/dotfiles-prodbygus/home/.p10k.zsh ~/.p10k.zsh
ln -sf ~/Projects/dotfiles-prodbygus/home/.prettierrc ~/.prettierrc
ln -sf ~/Projects/dotfiles-prodbygus/home/.eslintrc ~/.eslintrc

# Criar links simbólicos para diretórios na HOME
ln -sf ~/Projects/dotfiles-prodbygus/home/.hammerspoon ~/.hammerspoon

# Criar links simbólicos para arquivos em ~/.config
ln -sf ~/Projects/dotfiles-prodbygus/config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -sf ~/Projects/dotfiles-prodbygus/config/karabiner/tab_to_hyperkey.json ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.json
ln -sf ~/Projects/dotfiles-prodbygus/config/warp/nightfox_theme.yaml ~/.config/warp/themes/nightfox_theme.yaml
ln -sf ~/Projects/dotfiles-prodbygus/config/warp/launch_configurations.yaml ~/.config/warp/launch_configurations.yaml
```

### Passo 8: Instalar gerenciadores de versão

```bash
# NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# RBENV (Ruby Version Manager)
brew install rbenv ruby-build
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
```

### Passo 9: Instalar apps via Homebrew Cask

```bash
# Utilitários
brew install --cask rectangle iterm2 wezterm warp raycast alt-tab karabiner-elements

# Navegadores
brew install --cask google-chrome arc

# Ferramentas de desenvolvimento
brew install --cask visual-studio-code docker insomnia postman figma

# Comunicação
brew install --cask slack discord

# Outros
brew install --cask spotify notion
```

### Passo 10: Configuração do ambiente de desenvolvimento

Nodejs com NVM:

```bash
# Instalar versão LTS do Node
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# Instalar versão específica para compatibilidade com projetos legados
nvm install 16
nvm install 18

# Instalar PNPM
npm install -g pnpm

# Instalar Yarn
npm install -g yarn
```

Ferramentas globais para desenvolvimento web:

```bash
# Ferramentas de desenvolvimento global
npm install -g typescript ts-node

# CLI para React e Next.js
npm install -g create-react-app
npm install -g create-next-app

# Angular CLI
npm install -g @angular/cli

# Ferramentas de linting e formatação
npm install -g eslint prettier
npm install -g prettier-plugin-tailwindcss
npm install -g @tailwindcss/language-server

# Utilitários de desenvolvimento
npm install -g http-server             # Servidor HTTP simples
npm install -g json-server             # API REST fake
npm install -g nodemon                 # Auto-reload para Node.js
npm install -g npm-check-updates       # Verificar atualizações de dependências
npm install -g depcheck               # Verificar dependências não utilizadas
npm install -g serve                  # Servidor para apps estáticos
npm install -g vercel                  # Deploy para Vercel
npm install -g netlify-cli             # CLI da Netlify
```

### Passo 11: Configurar fonte para terminais

Instale a fonte MesloLGS Nerd Font:

```bash
# Baixar fontes
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Configure seu terminal para usar MesloLGS NF
# Em iTerm2: Preferences > Profiles > Text > Font > MesloLGS NF
```

### Passo 12: Criar arquivo de tokens seguro

```bash
# Criar arquivo de tokens com permissões restritas
touch ~/.tokens
chmod 600 ~/.tokens

# Editar arquivo para adicionar tokens
echo 'export GITHUB_TOKEN="seu_token_aqui"' >> ~/.tokens
```

### Passo 13: Configurar Karabiner-Elements (Hyperkey)

O [Karabiner-Elements](https://karabiner-elements.pqrs.org/) é uma ferramenta poderosa para personalizar o teclado no macOS. Vamos configurá-lo para usar a tecla Tab como Hyperkey (Cmd + Shift + Option + Control):

```bash
# Instalar Karabiner-Elements (se ainda não instalou no Passo 9)
brew install --cask karabiner-elements

# Adicionar configuração de Hyperkey
cat > ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.json << 'EOF'
{
  "title": "Change Tab to Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped",
  "rules": [
    {
      "description": "Change Tab to Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped",
      "manipulators": [
        {
          "type": "basic",
          "from": {
            "key_code": "tab",
            "modifiers": {
              "optional": [
                "any"
              ]
            }
          },
          "to": [
            {
              "key_code": "tab",
              "modifiers": [
                "left_control",
                "left_option",
                "left_command",
                "left_shift"
              ]
            }
          ],
          "to_if_alone": [
            {
              "key_code": "tab"
            }
          ]
        }
      ]
    }
  ]
}
EOF
```

1. Abra o Karabiner-Elements
2. Vá para a aba "Complex Modifications"
3. Clique em "Add rule"
4. Adicione a regra "Change Tab to Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped"

### Passo 14: Configurar VS Code para desenvolvimento web

```bash
# Instalar extensões essenciais para desenvolvimento web
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension bradlc.vscode-tailwindcss
code --install-extension formulahendry.auto-rename-tag
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension mikestead.dotenv
code --install-extension Christian-Kohler.npm-intellisense
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension eamodio.gitlens
code --install-extension usernamehw.errorlens
code --install-extension pkief.material-icon-theme
code --install-extension github.copilot
```

Configurar settings.json do VS Code:

```bash
cat > ~/Library/Application\ Support/Code/User/settings.json << 'EOF'
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },
  "tailwindCSS.includeLanguages": {
    "javascript": "javascript",
    "typescript": "typescript",
    "javascriptreact": "javascriptreact",
    "typescriptreact": "typescriptreact"
  },
  "editor.quickSuggestions": {
    "strings": true
  },
  "files.associations": {
    "*.css": "tailwindcss"
  },
  "emmet.includeLanguages": {
    "javascript": "javascriptreact",
    "typescript": "typescriptreact"
  },
  "terminal.integrated.defaultProfile.osx": "zsh",
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "workbench.iconTheme": "material-icon-theme",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
EOF
```

Configurar Prettier padrão:

```bash
cat > ~/.prettierrc << 'EOF'
{
  "singleQuote": true,
  "semi": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 100,
  "bracketSpacing": true,
  "arrowParens": "always",
  "endOfLine": "lf",
  "plugins": ["prettier-plugin-tailwindcss"]
}
EOF
```

Configurar ESLint padrão:

```bash
cat > ~/.eslintrc << 'EOF'
{
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react-hooks/recommended",
    "prettier"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaFeatures": {
      "jsx": true
    },
    "ecmaVersion": 2020,
    "sourceType": "module"
  },
  "plugins": [
    "react",
    "react-hooks",
    "@typescript-eslint"
  ],
  "rules": {
    "react/react-in-jsx-scope": "off",
    "react/prop-types": "off"
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  }
}
EOF
```

### Passo 15: Configurar terminal Warp

O [Warp](https://www.warp.dev/) é um terminal moderno baseado em Rust com recursos avançados como completions AI, comandos compartilháveis e uma interface otimizada para desenvolvedores:

```bash
# Instalar Warp (se ainda não instalou no Passo 9)
brew install --cask warp

# Configurar tema e personalização
mkdir -p ~/.warp/themes
cp ~/Projects/dotfiles-prodbygus/warp/nightfox_theme.yaml ~/.warp/themes/

# Configurar atalhos e comportamento
mkdir -p ~/.warp/launch_configurations
cp ~/Projects/dotfiles-prodbygus/warp/launch_configurations.yaml ~/.warp/
```

Para ativar o tema:
1. Abra o Warp
2. Pressione `Cmd+,` para abrir as preferências
3. Navegue para a seção "Appearance"
4. Selecione "NightFox" na lista de temas

Recursos do Warp incluem:
- Interface baseada em blocos de comandos
- AI para completar comandos
- Integração com workflows e notebooks
- Atalhos de teclado eficientes
- Navegação baseada em texto
- Compartilhamento seguro de comandos

## 📄 Arquivos de Configuração

Este repositório organiza os dotfiles em duas categorias principais:

### Arquivos na HOME (`~/`)

Arquivos que tradicionalmente ficam na pasta home do usuário:

- `.zshrc`: Configurações do shell ZSH
- `.p10k.zsh`: Configurações do tema Powerlevel10k
- `.prettierrc`: Configurações do formatador Prettier
- `.eslintrc`: Configurações do linter ESLint
- `.hammerspoon/`: Scripts de automação para macOS

### Arquivos em ~/.config

Arquivos que seguem a especificação XDG Base Directory:

- `wezterm/`: Configurações do terminal WezTerm
  - `wezterm.lua`: Configuração principal
- `karabiner/`: Configurações do Karabiner-Elements
  - `assets/complex_modifications/tab_to_hyperkey.json`: Configuração de Hyperkey
- `warp/`: Configurações do terminal Warp
  - `themes/nightfox_theme.yaml`: Tema personalizado
  - `launch_configurations.yaml`: Configurações de inicialização

### Templates e Scripts

- `web-templates/`: Templates para projetos web
- `scripts/`: Scripts de automação e configuração

## 🛠️ Ferramentas e Suas Funções

### Navegação & Terminal
- **WezTerm**: Terminal moderno com suporte a GPU e customização
- **Warp**: Terminal de nova geração com recursos de IA e interface otimizada
- **ZSH + Powerlevel10k**: Shell poderoso com tema visual informativo
- **Zoxide**: Navegação inteligente entre diretórios
- **FZF**: Seletor fuzzy para arquivos, histórico e muito mais
- **Yazi**: Navegador de arquivos no terminal

### Visualização
- **Bat**: Visualizador de texto avançado com sintaxe destacada
- **Eza**: Substituto moderno para o comando ls

### Desenvolvimento
- **Git**: Sistema de controle de versão
- **NVM**: Gerenciador de versões do Node.js
- **PNPM**: Gerenciador de pacotes Node.js eficiente
- **RBENV**: Gerenciador de versões Ruby

### Produtividade
- **TheFuck**: Corrige erros de digitação em comandos
- **Hammerspoon**: Automação para macOS

## ⚙️ Funções Personalizadas

O arquivo `.zshrc` inclui várias funções úteis:

### update-system

Atualiza todos os componentes do sistema com um único comando:

```bash
update-system
# ou simplesmente
update
```

### brewfzf

Interface visual para buscar e instalar pacotes Homebrew:

```bash
brewfzf
# ou
brewi
```

### cf

Navegador de diretórios usando FZF com o histórico do Zoxide:

```bash
cf
```

### github-init

Cria um novo repositório local e remoto GitHub:

```bash
github-init nome-do-repositorio [private]
```

### github-delete

Remove um repositório do GitHub:

```bash
github-delete nome-do-repositorio
```

### create-gitignore

Gera um arquivo .gitignore com base no tipo de projeto:

```bash
create-gitignore node
# ou
create-gitignore python
```

### create-web-project

Cria um novo projeto web com configurações pré-definidas:

```bash
create-web-project my-app react-ts     # Cria um projeto React com TypeScript
create-web-project my-app next-js      # Cria um projeto Next.js
create-web-project my-app next-ts      # Cria um projeto Next.js com TypeScript
```

### tailwind-init

Inicializa o Tailwind CSS em um projeto existente:

```bash
tailwind-init       # Configura Tailwind CSS no projeto atual
```

## 🤖 Configurações Adicionais

### Keybindings no macOS
- Mover mouse entre monitores: **Cmd+Ctrl+Left** e **Cmd+Ctrl+Right**
- Pesquisa de comandos no histórico: setas **↑** e **↓**
- Navegar por palavra: **Ctrl+Left** e **Ctrl+Right**
- Hyperkey (Tab como Cmd+Shift+Option+Control): Segure **Tab** + qualquer tecla

## 🔄 Manutenção

Para manter seu sistema atualizado após a instalação, execute regularmente:

```bash
update-system
```

## 🔐 Segurança

Lembre-se de configurar seu arquivo `~/.tokens` corretamente para as funções GitHub:

```bash
export GITHUB_TOKEN="seu_token_aqui"
```

É importante manter esse arquivo com permissões restritas (`chmod 600 ~/.tokens`).