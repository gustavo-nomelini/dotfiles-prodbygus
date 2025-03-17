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

### Passo 4: Configurar o Powerlevel10k

Esta configuração usa o Powerlevel10k diretamente com ZSH nativo, sem depender do Oh-My-Zsh, proporcionando uma inicialização mais rápida e melhor desempenho.level10k:

Instale o tema Powerlevel10k:

```basho "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
brew install romkatv/powerlevel10k/powerlevel10k```
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
```Configure o Powerlevel10k:

Configure o Powerlevel10k:

```bash
p10k configure
```ins para o ZSH

### Passo 5: Instalar plugins para o ZSH
gins
```bashw install zsh-autosuggestions zsh-syntax-highlighting
# Instalar plugins
brew install zsh-autosuggestions zsh-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
# Adicionar ao .zshrcource $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```### Passo 6: Clonar este repositório de dotfiles

### Passo 6: Clonar este repositório de dotfiles

```bash clone https://github.com/gustavo-nomelini/dotfiles-prodbygus.git ~/Projects/dotfiles-prodbygus
mkdir -p ~/Projectscd ~/Projects/dotfiles-prodbygus
git clone https://github.com/gustavo-nomelini/dotfiles-prodbygus.git ~/Projects/dotfiles-prodbygus
cd ~/Projects/dotfiles-prodbygus
```so 7: Criar links simbólicos para os dotfiles

### Passo 7: Criar links simbólicos para os dotfiles

```bashir -p ~/dotfiles_backup
# Backup dos arquivos existentes[ -f ~/.zshrc ] && mv ~/.zshrc ~/dotfiles_backup/.zshrc_backup
mkdir -p ~/dotfiles_backups_backup/.wezterm.lua_backup
[ -f ~/.zshrc ] && mv ~/.zshrc ~/dotfiles_backup/.zshrc_backup[ -d ~/.hammerspoon ] && mv ~/.hammerspoon ~/dotfiles_backup/.hammerspoon_backup
[ -f ~/.wezterm.lua ] && mv ~/.wezterm.lua ~/dotfiles_backup/.wezterm.lua_backup.config/warp ] && mv ~/.config/warp ~/dotfiles_backup/warp_backup
[ -d ~/.hammerspoon ] && mv ~/.hammerspoon ~/dotfiles_backup/.hammerspoon_backup
[ -d ~/.config/warp ] && mv ~/.config/warp ~/dotfiles_backup/warp_backupiguração necessários

# Criar diretórios de configuração necessários
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/.config/warp/themes
mkdir -p ~/.config/warp/launch_configurations
mkdir -p ~/.config/wezterm

# Criar links simbólicos para arquivos na HOMEdbygus/home/.p10k.zsh ~/.p10k.zsh
ln -sf ~/Projects/dotfiles-prodbygus/home/.zshrc ~/.zshrcettierrc ~/.prettierrc
ln -sf ~/Projects/dotfiles-prodbygus/home/.p10k.zsh ~/.p10k.zsh-prodbygus/home/.eslintrc ~/.eslintrc
ln -sf ~/Projects/dotfiles-prodbygus/home/.prettierrc ~/.prettierrc
ln -sf ~/Projects/dotfiles-prodbygus/home/.eslintrc ~/.eslintrcME
.hammerspoon
# Criar links simbólicos para diretórios na HOME
ln -sf ~/Projects/dotfiles-prodbygus/home/.hammerspoon ~/.hammerspoon
 ~/.config/wezterm/wezterm.lua
# Criar links simbólicos para arquivos em ~/.configln -sf ~/Projects/dotfiles-prodbygus/config/karabiner/tab_to_hyperkey.json ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.json
ln -sf ~/Projects/dotfiles-prodbygus/config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua/nightfox_theme.yaml ~/.config/warp/themes/nightfox_theme.yaml
ln -sf ~/Projects/dotfiles-prodbygus/config/karabiner/tab_to_hyperkey.json ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.jsons.yaml ~/.config/warp/launch_configurations.yaml
ln -sf ~/Projects/dotfiles-prodbygus/config/warp/nightfox_theme.yaml ~/.config/warp/themes/nightfox_theme.yaml```
ln -sf ~/Projects/dotfiles-prodbygus/config/warp/launch_configurations.yaml ~/.config/warp/launch_configurations.yaml
```

### Passo 8: Instalar gerenciadores de versão

```bashl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
# NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
brew install rbenv ruby-build
# RBENV (Ruby Version Manager)val "$(rbenv init - zsh)"' >> ~/.zshrc
brew install rbenv ruby-build
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
```### Passo 9: Instalar apps via Homebrew Cask

### Passo 9: Instalar apps via Homebrew Cask

```bashw install --cask rectangle iterm2 wezterm warp raycast alt-tab karabiner-elements
# Utilitários
brew install --cask rectangle iterm2 wezterm warp raycast alt-tab karabiner-elements
brew install --cask google-chrome arc
# Navegadores
brew install --cask google-chrome arc de desenvolvimento

# Ferramentas de desenvolvimento
brew install --cask visual-studio-code docker insomnia postman figma

# Comunicação
brew install --cask slack discord

# Outros```
brew install --cask spotify notion
```iente de desenvolvimento

### Passo 10: Configuração do ambiente de desenvolvimentoom NVM:

Nodejs com NVM:bash
# Instalar versão LTS do Node
```bash
# Instalar versão LTS do Nodenvm use --lts
nvm install --ltslt 'lts/*'
nvm use --lts
nvm alias default 'lts/*'lar versão específica para compatibilidade com projetos legados

# Instalar versão específica para compatibilidade com projetos legados
nvm install 16
nvm install 18
npm install -g pnpm
# Instalar PNPM
npm install -g pnpmn
 yarn
# Instalar Yarn```
npm install -g yarn
``` para desenvolvimento web:

Ferramentas globais para desenvolvimento web:
senvolvimento global
```bash install -g typescript ts-node
# Ferramentas de desenvolvimento global
npm install -g typescript ts-node
npm install -g create-react-app
# CLI para React e Next.jstall -g create-next-app
npm install -g create-react-app
npm install -g create-next-app
npm install -g @angular/cli
# Angular CLI
npm install -g @angular/cliatação

# Ferramentas de linting e formataçãonpm install -g prettier-plugin-tailwindcss
npm install -g eslint prettierg @tailwindcss/language-server
npm install -g prettier-plugin-tailwindcss
npm install -g @tailwindcss/language-server# Utilitários de desenvolvimento
  # Servidor HTTP simples
# Utilitários de desenvolvimento         # API REST fake
npm install -g http-server             # Servidor HTTP simplesuto-reload para Node.js
npm install -g json-server             # API REST fakerificar atualizações de dependências
npm install -g nodemon                 # Auto-reload para Node.jsnpm install -g depcheck               # Verificar dependências não utilizadas
npm install -g npm-check-updates       # Verificar atualizações de dependências      # Servidor para apps estáticos
npm install -g depcheck               # Verificar dependências não utilizadas
npm install -g serve                  # Servidor para apps estáticosy
npm install -g vercel                  # Deploy para Vercel
npm install -g netlify-cli             # CLI da Netlify
```

### Passo 11: Configurar fonte para terminais

Instale a fonte MesloLGS Nerd Font:bash
# Baixar fontes
```bash
# Baixar fontesbrew install --cask font-meslo-lg-nerd-font
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font# Configure seu terminal para usar MesloLGS NF
erm2: Preferences > Profiles > Text > Font > MesloLGS NF
# Configure seu terminal para usar MesloLGS NF
# Em iTerm2: Preferences > Profiles > Text > Font > MesloLGS NF
```o

### Passo 12: Criar arquivo de tokens seguro

```bashch ~/.tokens
# Criar arquivo de tokens com permissões restritaschmod 600 ~/.tokens
touch ~/.tokens
chmod 600 ~/.tokens# Editar arquivo para adicionar tokens
xport GITHUB_TOKEN="seu_token_aqui"' >> ~/.tokens
# Editar arquivo para adicionar tokens
echo 'export GITHUB_TOKEN="seu_token_aqui"' >> ~/.tokens
```gurar Karabiner-Elements (Hyperkey)

### Passo 13: Configurar Karabiner-Elements (Hyperkey)er-elements.pqrs.org/) é uma ferramenta poderosa para personalizar o teclado no macOS. Vamos configurá-lo para usar a tecla Tab como Hyperkey (Cmd + Shift + Option + Control):

O [Karabiner-Elements](https://karabiner-elements.pqrs.org/) é uma ferramenta poderosa para personalizar o teclado no macOS. Vamos configurá-lo para usar a tecla Tab como Hyperkey (Cmd + Shift + Option + Control):bash
# Instalar Karabiner-Elements (se ainda não instalou no Passo 9)
```bash
# Instalar Karabiner-Elements (se ainda não instalou no Passo 9)
brew install --cask karabiner-elements
cat > ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.json << 'EOF'
# Adicionar configuração de Hyperkey
cat > ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.json << 'EOF'n tapped",
{
  "title": "Change Tab to Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped",    {
  "rules": [Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped",
    {
      "description": "Change Tab to Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped",       {
      "manipulators": [
        {rom": {
          "type": "basic",       "key_code": "tab",
          "from": {
            "key_code": "tab",": [
            "modifiers": {       "any"
              "optional": [
                "any"
              ]
            }
          },
          "to": [de": "tab",
            {modifiers": [
              "key_code": "tab",   "left_control",
              "modifiers": [    "left_option",
                "left_control",left_command",
                "left_option",   "left_shift"
                "left_command",
                "left_shift"
              ]
            }
          ],
          "to_if_alone": [ab"
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
```ra o Karabiner-Elements
Vá para a aba "Complex Modifications"
1. Abra o Karabiner-Elements. Clique em "Add rule"
2. Vá para a aba "Complex Modifications"Adicione a regra "Change Tab to Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped"
3. Clique em "Add rule"
4. Adicione a regra "Change Tab to Hyper Key (⌘+⌥+⌃+⇧) when held, Tab when tapped"### Passo 14: Configurar VS Code para desenvolvimento web

### Passo 14: Configurar VS Code para desenvolvimento web
senciais para desenvolvimento web
```bash
# Instalar extensões essenciais para desenvolvimento webcode --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscodecode --install-extension formulahendry.auto-rename-tag
code --install-extension bradlc.vscode-tailwindcssinstall-extension dsznajder.es7-react-js-snippets
code --install-extension formulahendry.auto-rename-tag
code --install-extension dsznajder.es7-react-js-snippetsntellisense
code --install-extension mikestead.dotenve-spell-checker
code --install-extension Christian-Kohler.npm-intellisense
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension eamodio.gitlens
code --install-extension usernamehw.errorlens
code --install-extension pkief.material-icon-theme
code --install-extension github.copilot
```

Configurar settings.json do VS Code:
de/User/settings.json << 'EOF'
```bash
cat > ~/Library/Application\ Support/Code/User/settings.json << 'EOF'  "editor.formatOnSave": true,
{.prettier-vscode",
  "editor.formatOnSave": true,  "editor.codeActionsOnSave": {
  "editor.defaultFormatter": "esbenp.prettier-vscode",urce.fixAll.eslint": true
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true "tailwindCSS.includeLanguages": {
  },,
  "tailwindCSS.includeLanguages": {
    "javascript": "javascript",iptreact",
    "typescript": "typescript",ptreact"
    "javascriptreact": "javascriptreact",
    "typescriptreact": "typescriptreact"
  },
  "editor.quickSuggestions": {
    "strings": true
  },
  "files.associations": {
    "*.css": "tailwindcss"
  },javascriptreact",
  "emmet.includeLanguages": {"typescript": "typescriptreact"
    "javascript": "javascriptreact",
    "typescript": "typescriptreact"aultProfile.osx": "zsh",
  },avascript.updateImportsOnFileMove.enabled": "always",
  "terminal.integrated.defaultProfile.osx": "zsh",FileMove.enabled": "always",
  "javascript.updateImportsOnFileMove.enabled": "always",con-theme",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "workbench.iconTheme": "material-icon-theme","editor.defaultFormatter": "esbenp.prettier-vscode"
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"]": {
  },
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"]": {
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
EOF
```

Configurar Prettier padrão:``bash
 > ~/.prettierrc << 'EOF'
```bash
cat > ~/.prettierrc << 'EOF'  "singleQuote": true,
{
  "singleQuote": true,  "tabWidth": 2,
  "semi": true,lingComma": "es5",
  "tabWidth": 2,
  "trailingComma": "es5", "bracketSpacing": true,
  "printWidth": 100,ys",
  "bracketSpacing": true,"lf",
  "arrowParens": "always",rettier-plugin-tailwindcss"]
  "endOfLine": "lf",
  "plugins": ["prettier-plugin-tailwindcss"]
}
EOF
```drão:

Configurar ESLint padrão:``bash
 > ~/.eslintrc << 'EOF'
```bash
cat > ~/.eslintrc << 'EOF'  "extends": [
{
  "extends": [    "plugin:react/recommended",
    "eslint:recommended",ugin:@typescript-eslint/recommended",
    "plugin:react/recommended",commended",
    "plugin:@typescript-eslint/recommended",   "prettier"
    "plugin:react-hooks/recommended",
    "prettier"eslint/parser",
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaFeatures": {
      "jsx": true"ecmaVersion": 2020,
    },
    "ecmaVersion": 2020,
    "sourceType": "module"
  },
  "plugins": [eact-hooks",
    "react",
    "react-hooks",
    "@typescript-eslint"ules": {
  ],ct-in-jsx-scope": "off",
  "rules": {rop-types": "off"
    "react/react-in-jsx-scope": "off",
    "react/prop-types": "off"
  },"react": {
  "settings": {on": "detect"
    "react": {
      "version": "detect"
    }
  }
}
EOF
```asso 15: Configurar terminal Warp

### Passo 15: Configurar terminal Warp [Warp](https://www.warp.dev/) é um terminal moderno baseado em Rust com recursos avançados como completions AI, comandos compartilháveis e uma interface otimizada para desenvolvedores:

O [Warp](https://www.warp.dev/) é um terminal moderno baseado em Rust com recursos avançados como completions AI, comandos compartilháveis e uma interface otimizada para desenvolvedores:bash
# Instalar Warp (se ainda não instalou no Passo 9)
```bash
# Instalar Warp (se ainda não instalou no Passo 9)
brew install --cask warp
mkdir -p ~/.warp/themes
# Configurar tema e personalizaçãoojects/dotfiles-prodbygus/warp/nightfox_theme.yaml ~/.warp/themes/
mkdir -p ~/.warp/themes
cp ~/Projects/dotfiles-prodbygus/warp/nightfox_theme.yaml ~/.warp/themes/omportamento
mkdir -p ~/.warp/launch_configurations
# Configurar atalhos e comportamentoarp/launch_configurations.yaml ~/.warp/
mkdir -p ~/.warp/launch_configurations
cp ~/Projects/dotfiles-prodbygus/warp/launch_configurations.yaml ~/.warp/
```Para ativar o tema:

Para ativar o tema:ferências
1. Abra o Warp
2. Pressione `Cmd+,` para abrir as preferênciasSelecione "NightFox" na lista de temas
3. Navegue para a seção "Appearance"
4. Selecione "NightFox" na lista de temascluem:
seada em blocos de comandos
Recursos do Warp incluem:
- Interface baseada em blocos de comandosks
- AI para completar comandos
- Integração com workflows e notebooks- Navegação baseada em texto
- Atalhos de teclado eficientes de comandos
- Navegação baseada em texto
- Compartilhamento seguro de comandosão

## 📄 Arquivos de Configuraçãotfiles em duas categorias principais:

Este repositório organiza os dotfiles em duas categorias principais:

### Arquivos na HOME (`~/`)ficam na pasta home do usuário:

Arquivos que tradicionalmente ficam na pasta home do usuário:
- `.p10k.zsh`: Configurações do tema Powerlevel10k
- `.zshrc`: Configurações do shell ZSHões do formatador Prettier
- `.p10k.zsh`: Configurações do tema Powerlevel10k- `.eslintrc`: Configurações do linter ESLint
- `.prettierrc`: Configurações do formatador Prettier
- `.eslintrc`: Configurações do linter ESLint
- `.hammerspoon/`: Scripts de automação para macOS

### Arquivos em ~/.configy:

Arquivos que seguem a especificação XDG Base Directory:
  - `wezterm.lua`: Configuração principal
- `wezterm/`: Configurações do terminal WezTermções do Karabiner-Elements
  - `wezterm.lua`: Configuração principal  - `assets/complex_modifications/tab_to_hyperkey.json`: Configuração de Hyperkey
- `karabiner/`: Configurações do Karabiner-Elements
  - `assets/complex_modifications/tab_to_hyperkey.json`: Configuração de Hyperkey  - `themes/nightfox_theme.yaml`: Tema personalizado
- `warp/`: Configurações do terminal Warp de inicialização
  - `themes/nightfox_theme.yaml`: Tema personalizado
  - `launch_configurations.yaml`: Configurações de inicialização

### Templates e Scriptsos web

- `web-templates/`: Templates para projetos web
- `scripts/`: Scripts de automação e configuração## 🛠️ Ferramentas e Suas Funções

## 🛠️ Ferramentas e Suas Funções### Navegação & Terminal
PU e customização
### Navegação & Terminal de IA e interface otimizada
- **WezTerm**: Terminal moderno com suporte a GPU e customização- **ZSH + Powerlevel10k**: Shell poderoso com tema visual informativo
- **Warp**: Terminal de nova geração com recursos de IA e interface otimizadate entre diretórios
- **ZSH + Powerlevel10k**: Shell poderoso com tema visual informativo- **FZF**: Seletor fuzzy para arquivos, histórico e muito mais
- **Zoxide**: Navegação inteligente entre diretórios arquivos no terminal
- **FZF**: Seletor fuzzy para arquivos, histórico e muito mais
- **Yazi**: Navegador de arquivos no terminal

### Visualização
- **Bat**: Visualizador de texto avançado com sintaxe destacada
- **Eza**: Substituto moderno para o comando ls
- **Git**: Sistema de controle de versão
### Desenvolvimentociador de versões do Node.js
- **Git**: Sistema de controle de versão
- **NVM**: Gerenciador de versões do Node.js
- **PNPM**: Gerenciador de pacotes Node.js eficiente
- **RBENV**: Gerenciador de versões Ruby
o em comandos
### Produtividade
- **TheFuck**: Corrige erros de digitação em comandos
- **Hammerspoon**: Automação para macOS

## ⚙️ Funções Personalizadas` inclui várias funções úteis:

O arquivo `.zshrc` inclui várias funções úteis:

### update-systems do sistema com um único comando:

Atualiza todos os componentes do sistema com um único comando:
update-system
```bash
update-systemupdate
# ou simplesmente
update
```wfzf

### brewfzfpara buscar e instalar pacotes Homebrew:

Interface visual para buscar e instalar pacotes Homebrew:bash
brewfzf
```bash
brewfzfbrewi
# ou
brewi
```

### cfgador de diretórios usando FZF com o histórico do Zoxide:

Navegador de diretórios usando FZF com o histórico do Zoxide:bash
cf
```bash
cf
```

### github-init novo repositório local e remoto GitHub:

Cria um novo repositório local e remoto GitHub:bash
github-init nome-do-repositorio [private]
```bash
github-init nome-do-repositorio [private]
```

### github-deleteum repositório do GitHub:

Remove um repositório do GitHub:bash
github-delete nome-do-repositorio
```bash
github-delete nome-do-repositorio
```

### create-gitignore arquivo .gitignore com base no tipo de projeto:

Gera um arquivo .gitignore com base no tipo de projeto:bash
create-gitignore node
```bash
create-gitignore nodecreate-gitignore python
# ou
create-gitignore python
```ate-web-project

### create-web-project um novo projeto web com configurações pré-definidas:

Cria um novo projeto web com configurações pré-definidas:bash
create-web-project my-app react-ts     # Cria um projeto React com TypeScript
```bashapp next-js      # Cria um projeto Next.js
create-web-project my-app react-ts     # Cria um projeto React com TypeScriptcreate-web-project my-app next-ts      # Cria um projeto Next.js com TypeScript
create-web-project my-app next-js      # Cria um projeto Next.js
create-web-project my-app next-ts      # Cria um projeto Next.js com TypeScript
```lwind-init

### tailwind-init

Inicializa o Tailwind CSS em um projeto existente:bash
tailwind-init       # Configura Tailwind CSS no projeto atual
```bash
tailwind-init       # Configura Tailwind CSS no projeto atual
```

## 🤖 Configurações Adicionaisbindings no macOS
+Right**
### Keybindings no macOSesquisa de comandos no histórico: setas **↑** e **↓**
- Mover mouse entre monitores: **Cmd+Ctrl+Left** e **Cmd+Ctrl+Right**- Navegar por palavra: **Ctrl+Left** e **Ctrl+Right**
- Pesquisa de comandos no histórico: setas **↑** e **↓**+Option+Control): Segure **Tab** + qualquer tecla
- Navegar por palavra: **Ctrl+Left** e **Ctrl+Right**
- Hyperkey (Tab como Cmd+Shift+Option+Control): Segure **Tab** + qualquer tecla

## 🔄 Manutençãoecute regularmente:

Para manter seu sistema atualizado após a instalação, execute regularmente:
update-system
```bash
update-system
```

## 🔐 Segurançase de configurar seu arquivo `~/.tokens` corretamente para as funções GitHub:

Lembre-se de configurar seu arquivo `~/.tokens` corretamente para as funções GitHub:bash
export GITHUB_TOKEN="seu_token_aqui"
```bash
export GITHUB_TOKEN="seu_token_aqui"
```É importante manter esse arquivo com permissões restritas (`chmod 600 ~/.tokens`).