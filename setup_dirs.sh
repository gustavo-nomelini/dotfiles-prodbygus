#!/bin/bash

# Script para reorganizar os dotfiles

echo "🏗️  Reorganizando estrutura de diretórios..."

# Criar diretórios principais
mkdir -p home
mkdir -p config/wezterm
mkdir -p config/karabiner/assets/complex_modifications
mkdir -p config/warp/themes

# Mover arquivos para a HOME
mv .zshrc home/ 2>/dev/null
[ -f .p10k.zsh ] && mv .p10k.zsh home/
[ -d .hammerspoon ] && mv .hammerspoon home/
[ -f .prettierrc ] && mv .prettierrc home/
[ -f .eslintrc ] && mv .eslintrc home/

# Mover arquivos para ~/.config
[ -f .wezterm.lua ] && mv .wezterm.lua config/wezterm/wezterm.lua
[ -f karabiner/tab_to_hyperkey.json ] && mv karabiner/tab_to_hyperkey.json config/karabiner/assets/complex_modifications/
[ -f warp/nightfox_theme.yaml ] && mv warp/nightfox_theme.yaml config/warp/themes/
[ -f warp/launch_configurations.yaml ] && mv warp/launch_configurations.yaml config/warp/

# Remover diretórios vazios antigos
rmdir karabiner 2>/dev/null
rmdir warp 2>/dev/null

echo "✅ Reorganização concluída!"
echo "Por favor, verifique se todos os arquivos foram movidos corretamente."
