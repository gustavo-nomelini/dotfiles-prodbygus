# Estrutura de Diretórios dos Dotfiles

Este documento explica a organização dos arquivos de configuração (dotfiles) neste repositório.

## Visão Geral

```
dotfiles-prodbygus/
├── home/                 # Arquivos que ficam diretamente em ~/
│   ├── .zshrc            # Configuração do ZSH
│   ├── .p10k.zsh         # Configuração do Powerlevel10k
│   ├── .prettierrc       # Configuração do Prettier
│   ├── .eslintrc         # Configuração do ESLint
│   └── .hammerspoon/     # Configurações do Hammerspoon
│
├── config/               # Arquivos que ficam em ~/.config/
│   ├── wezterm/          # Configurações do WezTerm
│   │   └── wezterm.lua   # Arquivo principal de configuração
│   ├── karabiner/        # Configurações do Karabiner
│   │   └── assets/complex_modifications/
│   │       └── tab_to_hyperkey.json
│   └── warp/             # Configurações do terminal Warp
│       ├── themes/
│       │   └── nightfox_theme.yaml
│       └── launch_configurations.yaml
│
├── scripts/              # Scripts utilitários
│   └── setup-web-dev.sh  # Configuração do ambiente de dev web
│
├── web-templates/        # Templates para projetos web
│   ├── tsconfig.base.json
│   └── nextjs-config.js
│
└── colors/               # Definições de cores para terminais
    └── dracula.toml
```

## Filosofia de Organização

1. **Pastas XDG-compliant**: Seguimos o padrão XDG Base Directory Specification sempre que possível, 
   colocando configurações em `~/.config/` quando o aplicativo suporta.

2. **ZSH Nativo com Powerlevel10k**: Usamos ZSH nativo com Powerlevel10k direto, sem depender do framework 
   Oh-My-Zsh, para uma configuração mais leve e rápida.

3. **HOME direta apenas quando necessário**: Alguns arquivos precisam estar diretamente em `~/` 
   por convenção ou limitação dos aplicativos.

4. **Arquivos de templates separados**: Mantemos templates e snippets reutilizáveis separados 
   da configuração principal.

5. **Scripts em seu próprio diretório**: Scripts de instalação e configuração são mantidos em `scripts/`.

## Instalação

Para instalar esses dotfiles, execute:

```bash
git clone https://github.com/gustavo-nomelini/dotfiles-prodbygus.git ~/Projects/dotfiles-prodbygus
cd ~/Projects/dotfiles-prodbygus
./setup_dirs.sh     # Se necessário reorganizar estrutura
./install.sh        # Para criar links simbólicos
```

Isso criará links simbólicos nas localizações apropriadas para cada arquivo de configuração.
