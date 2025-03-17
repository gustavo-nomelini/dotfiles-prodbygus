# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Configurar para não mostrar avisos do POWERLEVEL
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#=================================================================
#                   CONFIGURAÇÕES BÁSICAS
#=================================================================

# Configuração do histórico
HISTFILE=$HOME/.zhistory
SAVEHIST=10000       # Aumentado para armazenar mais comandos
HISTSIZE=9999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt hist_ignore_space      # Não armazena comandos que começam com espaço
setopt extended_history       # Salva timestamp e duração

# Configuração de completação
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Keybindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey "^[[1;5C" forward-word   # Ctrl+Right para avançar uma palavra
bindkey "^[[1;5D" backward-word  # Ctrl+Left para voltar uma palavra

#=================================================================
#                       ALIASES
#=================================================================

# --- Aliases do Sistema ---
alias zsh-source="source ~/.zshrc"
alias zsh-code="nvim ~/.zshrc"
alias zsh-edit="$EDITOR ~/.zshrc"
alias la="ls -lah"
alias ll="ls -l"
alias lt="ls --tree"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias df="df -h"
alias du="du -h"

# --- Aliases de Desenvolvimento ---
alias zed-code="zed . &"
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias py="python3"
alias pip="pip3"
alias npml="npm list -g --depth=0"

# --- Aliases de Navegação ---
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias home="cd ~"
alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias proj="cd ~/Projects"

#=================================================================
#                    GERENCIADORES DE PACOTES
#=================================================================

# --- NVM (Node Version Manager) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- PNPM ---
export PNPM_HOME="/Users/guwop/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- RBENV (Ruby) ---
export PATH="$HOME/.rbenv/shims:$PATH"

#=================================================================
#               FERRAMENTAS DE PRODUTIVIDADE
#=================================================================

# --- Zoxide (navegação inteligente) ---
eval "$(zoxide init zsh)"
alias cd="z"

# --- FZF (fuzzy finder) ---
eval "$(fzf --zsh)"

# Tema do FZF
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# Configuração do FD com FZF
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Configuração de previsualizações
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# --- Bat (visualizador de arquivos) ---
export BAT_THEME=tokyonight_night
alias cat="bat"  # Substitui cat por bat

# --- Eza (ls aprimorado) ---
alias ls="eza --icons=always"
alias tree="eza --tree --icons=always"

# --- TheFuck (correção de comandos) ---
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# --- Yazi (gerenciador de arquivos) ---
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#=================================================================
#                  FUNÇÕES PERSONALIZADAS
#=================================================================

# --- Atualizador do sistema ---
update-system() {
  echo "🚀 Iniciando atualização completa do sistema..."
  
  echo "\n📱 Atualizando macOS..."
  sudo softwareupdate -l && sudo softwareupdate -i -a
  
  echo "\n🍺 Atualizando Homebrew..."
  brew update && brew upgrade && brew cleanup
  
  echo "\n📦 Atualizando gerenciadores de pacotes JavaScript..."
  echo "- Atualizando npm..."
  npm install -g npm
  
  if command -v pnpm >/dev/null 2>&1; then
    echo "- Atualizando pnpm..."
    pnpm add -g pnpm
  fi
  
  if command -v yarn >/dev/null 2>&1; then
    echo "- Atualizando yarn..."
    if [[ $(yarn -v) =~ ^1 ]]; then
      npm install -g yarn
    else
      yarn set version latest
    fi
  fi
  
  if command -v rustup >/dev/null 2>&1; then
    echo "\n🦀 Atualizando Rust..."
    rustup update
  fi
  
  echo "\n✅ Sistema atualizado com sucesso!"
}
alias update="update-system"

# --- Instalador via Homebrew com FZF ---
brewfzf() {
  local selected
  selected=$(brew search "" 2>/dev/null | fzf --prompt="🔍 Busca Homebrew: " --preview="brew info {}" --preview-window=right:50%)

  if [[ -n "$selected" ]]; then
    echo "📦 Instalando $selected..."
    command brew install "$selected"
  else
    echo "❌ Nenhum pacote selecionado."
  fi
}
alias brewi="brewfzf"

# --- Navegador de diretórios com FZF ---
cf() {
  local dir
  dir=$(zoxide query -l | fzf --preview="ls -1 {}" --preview-window=down:50%:wrap --prompt="📂 Navegar para: ")

  if [[ -n "$dir" ]]; then
    cd "$dir"
  fi
}

# --- Funções Git/GitHub ---
# Cria um arquivo .gitignore automaticamente com base no tipo de projeto
create-gitignore() {
  if [ -z "$1" ]; then
    echo "Uso: create-gitignore <tipo>"
    echo "Exemplos: node, python, java, etc."
    curl -sL https://www.gitignore.io/api/list | tr ',' '\n' | sort
    return 1
  fi
  
  curl -sL "https://www.gitignore.io/api/$1" > .gitignore
  echo "✅ Arquivo .gitignore para '$1' criado com sucesso!"
}

# IMPORTANTE: Funções que usam tokens GitHub precisam ser atualizadas para usar
# variáveis de ambiente em vez de hardcoded tokens. 
# Crie um arquivo ~/.tokens que será importado abaixo

# Carregar tokens de credenciais de um arquivo seguro
if [[ -f "$HOME/.tokens" ]]; then
  source "$HOME/.tokens"
else
  echo "⚠️  Arquivo de tokens não encontrado em ~/.tokens"
  echo "Crie este arquivo para armazenar suas credenciais de forma segura"
  echo 'Exemplo: export GITHUB_TOKEN="seu_token_aqui"'
fi

# Inicializar repositório GitHub
github-init() {
  if ! command -v git &> /dev/null; then
    echo "❌ Esta função requer 'git'. Por favor, instale-o primeiro."
    return 1
  fi

  if [ $# -lt 1 ]; then
    echo "Uso: github-init <nome_repositório> [private]"
    echo "Exemplo: github-init meu-projeto private"
    return 1
  fi

  local repo_name="$1"
  local visibility="public"
  if [[ "$2" == "private" ]]; then
    visibility="private"
  fi
  
  # Usar variável de ambiente em vez de hardcoded token
  if [[ -z "$GITHUB_TOKEN" ]]; then
    echo "❌ GITHUB_TOKEN não definido. Configure-o no arquivo ~/.tokens"
    return 1
  fi
  
  local github_username="gustavo-nomelini"
  local github_url="https://github.com/${github_username}/${repo_name}.git"

  # Criar repositório no GitHub
  echo "🔨 Criando repositório GitHub '${repo_name}' (${visibility})..."
  curl -s -H "Authorization: token ${GITHUB_TOKEN}" \
       -d "{\"name\": \"${repo_name}\", \"private\": $( [[ $visibility == "private" ]] && echo true || echo false )}" \
       https://api.github.com/user/repos

  # Verificar se o repositório foi criado com sucesso
  if [[ $? -ne 0 ]]; then
    echo "❌ Falha ao criar o repositório no GitHub. Verifique seu token e permissões."
    return 1
  fi

  # Criar repositório local
  echo "📁 Criando repositório local '${repo_name}'..."
  mkdir "$repo_name" && cd "$repo_name" || return
  git init
  echo "# $repo_name" > README.md
  git add README.md
  git commit -m "Initial commit"
  git branch -M main

  # Adicionar remote e fazer push
  echo "🔄 Adicionando repositório remoto '${github_url}'..."
  git remote add origin "$github_url"
  echo "⬆️  Enviando para GitHub..."
  git push -u origin main

  echo "✅ Repositório '${repo_name}' inicializado e enviado para ${github_url}."
}

# Excluir repositório GitHub
github-delete() {
  if [ $# -ne 1 ]; then
    echo "Uso: github-delete <nome_repositório>"
    echo "Exemplo: github-delete meu-projeto"
    return 1
  fi

  local repo_name="$1"
  local github_username="gustavo-nomelini"
  
  # Usar variável de ambiente em vez de hardcoded token
  if [[ -z "$GITHUB_TOKEN" ]]; then
    echo "❌ GITHUB_TOKEN não definido. Configure-o no arquivo ~/.tokens"
    return 1
  fi

  echo "⚠️  Tem certeza que deseja excluir o repositório '${repo_name}'? Esta ação é irreversível! (yes/no)"
  read confirmation

  if [[ "$confirmation" != "yes" ]]; then
    echo "❌ Exclusão do repositório cancelada."
    return 1
  fi

  # Enviar requisição DELETE para API do GitHub
  echo "🗑️  Excluindo o repositório '${github_username}/${repo_name}'..."
  response=$(curl -s -o /dev/null -w "%{http_code}" \
    -X DELETE \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    "https://api.github.com/repos/${github_username}/${repo_name}")

  if [[ "$response" -eq 204 ]]; then
    echo "✅ Repositório '${repo_name}' excluído com sucesso."
    rm -rf .git*
  else
    echo "❌ Falha ao excluir repositório '${repo_name}'. Verifique se ele existe e suas permissões de token."
  fi
}

#=================================================================
#                PLUGINS E AUTOCOMPLETIONS
#=================================================================

# Carregar plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Angular CLI autocompletion
source <(ng completion script)

# Spicetify
export PATH=$PATH:/Users/guwop/.spicetify

#=================================================================
#            FUNÇÕES PARA DESENVOLVIMENTO WEB
#=================================================================

# --- Aliases de desenvolvimento web ---
alias dev="npm run dev"
alias start="npm start"
alias build="npm run build"
alias test="npm test"
alias lint="npm run lint"
alias format="npm run format || prettier --write ."
alias fresh="rm -rf node_modules/ && rm -rf package-lock.json && npm install"
alias ncu="npx npm-check-updates -i"

# Inicializar Tailwind CSS em um projeto
tailwind-init() {
  echo "🌈 Inicializando Tailwind CSS..."
  
  # Instalar dependências
  npm install -D tailwindcss postcss autoprefixer
  npx tailwindcss init -p
  
  # Detectar ambiente de projeto
  local is_next=false
  if [ -f "next.config.js" ] || [ -f "next.config.mjs" ] || grep -q "next" package.json; then
    is_next=true
  fi
  
  # Criar arquivo de configuração do Tailwind
  cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
    "./pages/**/*.{js,jsx,ts,tsx}",
    "./components/**/*.{js,jsx,ts,tsx}",
    "./app/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF
  
  # Adicionar diretivas Tailwind ao CSS principal
  if $is_next; then
    # Verificar se existe globals.css ou criar
    if [ -f "./src/app/globals.css" ]; then
      CSS_FILE="./src/app/globals.css"
    elif [ -f "./styles/globals.css" ]; then
      CSS_FILE="./styles/globals.css"
    else
      mkdir -p ./styles
      CSS_FILE="./styles/globals.css"
      touch $CSS_FILE
    fi
  else
    # Para projetos React padrão
    if [ -f "./src/index.css" ]; then
      CSS_FILE="./src/index.css"
    else
      CSS_FILE="./src/App.css"
      [ ! -f $CSS_FILE ] && touch $CSS_FILE
    fi
  fi
  
  # Adicionar diretivas Tailwind no início do arquivo CSS
  echo '@tailwind base;
@tailwind components;
@tailwind utilities;' > temp_file
  cat $CSS_FILE >> temp_file
  mv temp_file $CSS_FILE
  
  # Instalar plugin do Prettier para Tailwind
  npm install -D prettier prettier-plugin-tailwindcss
  
  echo "✅ Tailwind CSS configurado com sucesso!"
  echo "🎨 Adicione classes Tailwind aos seus componentes."
}

# Criar um novo projeto web com configurações pré-definidas
create-web-project() {
  if [ $# -lt 2 ]; then
    echo "Uso: create-web-project <nome-do-projeto> <tipo>"
    echo "Tipos disponíveis:"
    echo "  react-js    - React com JavaScript"
    echo "  react-ts    - React com TypeScript"
    echo "  next-js     - Next.js com JavaScript"
    echo "  next-ts     - Next.js com TypeScript + App Router"
    return 1
  fi
  
  local project_name=$1
  local project_type=$2
  
  echo "🚀 Criando projeto $project_name do tipo $project_type..."
  
  case $project_type in
    react-js)
      npx create-react-app $project_name
      cd $project_name
      npm install -D tailwindcss postcss autoprefixer
      npx tailwindcss init -p
      ;;
    react-ts)
      npx create-react-app $project_name --template typescript
      cd $project_name
      npm install -D tailwindcss postcss autoprefixer
      npx tailwindcss init -p
      ;;
    next-js)
      npx create-next-app@latest $project_name --js
      cd $project_name
      ;;
    next-ts)
      npx create-next-app@latest $project_name --ts
      cd $project_name
      ;;
    *)
      echo "❌ Tipo de projeto desconhecido: $project_type"
      echo "Tipos disponíveis: react-js, react-ts, next-js, next-ts"
      return 1
      ;;
  esac
  
  # Instalar dependências comuns
  npm install -D eslint prettier eslint-config-prettier
  
  # Configurar ESLint e Prettier
  cp ~/.eslintrc ./.eslintrc.json
  cp ~/.prettierrc ./.prettierrc
  
  # Adicionar scripts úteis ao package.json
  if [ "$project_type" = "next-js" ] || [ "$project_type" = "next-ts" ]; then
    npx -y npm-add-script -k "format" -v "prettier --write ."
    npx -y npm-add-script -k "lint:fix" -v "next lint --fix"
  else
    npx -y npm-add-script -k "format" -v "prettier --write ."
    npx -y npm-add-script -k "lint" -v "eslint src"
    npx -y npm-add-script -k "lint:fix" -v "eslint src --fix"
  fi
  
  echo "✅ Projeto $project_name criado com sucesso!"
  echo "📚 Execute 'cd $project_name && npm run dev' para iniciar o servidor de desenvolvimento."
}

# Verificar se o projeto atual é um projeto Next.js, React, ou Node
project-info() {
  local pkg_manager=""
  local framework=""
  local typescript=false
  local tailwind=false
  local node_version=""
  
  echo "🔍 Analisando projeto..."
  
  # Determinar gerenciador de pacotes
  if [ -f "package-lock.json" ]; then
    pkg_manager="npm"
  elif [ -f "yarn.lock" ]; then
    pkg_manager="yarn"
  elif [ -f "pnpm-lock.yaml" ]; then
    pkg_manager="pnpm"
  fi
  
  # Verificar framework
  if [ -f "next.config.js" ] || [ -f "next.config.mjs" ]; then
    framework="Next.js"
  elif grep -q "react" package.json; then
    if grep -q "react-dom" package.json; then
      framework="React"
    fi
  elif [ -f "angular.json" ]; then
    framework="Angular"
  elif grep -q "vue" package.json; then
    framework="Vue.js"
  elif grep -q "express" package.json; then
    framework="Node.js (Express)"
  elif [ -f "package.json" ]; then
    framework="Node.js"
  fi
  
  # Verificar TypeScript
  if [ -f "tsconfig.json" ]; then
    typescript=true
  fi
  
  # Verificar Tailwind
  if [ -f "tailwind.config.js" ] || [ -f "tailwind.config.ts" ]; then
    tailwind=true
  fi
  
  # Verificar versão do Node
  if command -v nvm &> /dev/null; then
    node_version=$(node -v)
  fi
  
  echo "📊 Informações do projeto:"
  [ -n "$framework" ] && echo "  • Framework: $framework"
  [ "$typescript" = true ] && echo "  • TypeScript: Sim" || echo "  • TypeScript: Não"
  [ "$tailwind" = true ] && echo "  • Tailwind CSS: Sim" || echo "  • Tailwind CSS: Não"
  [ -n "$pkg_manager" ] && echo "  • Gerenciador de pacotes: $pkg_manager"
  [ -n "$node_version" ] && echo "  • Node.js: $node_version"
}

# Limpar cache e reinstalar dependências em projetos JavaScript
clean-project() {
  echo "🧹 Limpando o projeto..."
  
  # Fazer backup de .env
  if [ -f ".env" ]; then
    cp .env .env.backup
    echo "📦 Backup do arquivo .env criado"
  fi
  
  # Identificar gerenciador de pacotes
  local pkg_manager="npm"
  if [ -f "yarn.lock" ]; then
    pkg_manager="yarn"
  elif [ -f "pnpm-lock.yaml" ]; then
    pkg_manager="pnpm"
  fi
  
  # Limpar cache e node_modules
  if [ "$pkg_manager" = "npm" ]; then
    rm -rf node_modules
    rm -rf package-lock.json
    npm cache clean --force
    npm install
  elif [ "$pkg_manager" = "yarn" ]; then
    rm -rf node_modules
    rm -rf yarn.lock
    yarn cache clean
    yarn install
  elif [ "$pkg_manager" = "pnpm" ]; then
    rm -rf node_modules
    rm -rf pnpm-lock.yaml
    pnpm store prune
    pnpm install
  fi
  
  # Restaurar .env
  if [ -f ".env.backup" ]; then
    mv .env.backup .env
    echo "📦 Arquivo .env restaurado"
  fi
  
  echo "✅ Projeto limpo e reinstalado!"
}
