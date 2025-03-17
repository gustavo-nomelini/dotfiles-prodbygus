#!/bin/bash

# Instalador principal para dotfiles
echo "🚀 Configurando dotfiles..."

# Backup dos arquivos existentes
echo "📦 Fazendo backup de arquivos existentes..."
mkdir -p ~/dotfiles_backup

backup_file() {
  local file=$1
  if [ -e "$file" ]; then
    echo "Fazendo backup de $file"
    mv "$file" ~/dotfiles_backup/$(basename "$file")_backup
  fi
}

# Backup de arquivos na HOME
backup_file ~/.zshrc
backup_file ~/.p10k.zsh
backup_file ~/.prettierrc
backup_file ~/.eslintrc
backup_file ~/.hammerspoon

# Backup de arquivos em ~/.config
backup_file ~/.config/wezterm/wezterm.lua
backup_file ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.json
backup_file ~/.config/warp/themes/nightfox_theme.yaml
backup_file ~/.config/warp/launch_configurations.yaml

# Criar diretórios necessários
echo "📁 Criando diretórios de configuração..."
mkdir -p ~/.config/wezterm
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/.config/warp/themes

# Remover qualquer configuração relacionada ao oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "⚠️ Oh-My-Zsh detectado. Este setup usa Powerlevel10k diretamente com ZSH."
  echo "   Não será feita nenhuma alteração na instalação existente do Oh-My-Zsh."
fi

# Link para arquivos na HOME
echo "🔗 Criando links simbólicos para arquivos na HOME..."
ln -sf "$PWD/home/.zshrc" ~/.zshrc
ln -sf "$PWD/home/.p10k.zsh" ~/.p10k.zsh
ln -sf "$PWD/home/.prettierrc" ~/.prettierrc
ln -sf "$PWD/home/.eslintrc" ~/.eslintrc
ln -sf "$PWD/home/.hammerspoon" ~/.hammerspoon

# Link para arquivos em ~/.config
echo "🔗 Criando links simbólicos para arquivos em ~/.config..."
ln -sf "$PWD/config/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
ln -sf "$PWD/config/karabiner/assets/complex_modifications/tab_to_hyperkey.json" ~/.config/karabiner/assets/complex_modifications/tab_to_hyperkey.json
ln -sf "$PWD/config/warp/themes/nightfox_theme.yaml" ~/.config/warp/themes/nightfox_theme.yaml
ln -sf "$PWD/config/warp/launch_configurations.yaml" ~/.config/warp/launch_configurations.yaml

echo "✅ Dotfiles instalados com sucesso!"
echo "🔄 Para aplicar as configurações de ZSH, execute: source ~/.zshrc"
