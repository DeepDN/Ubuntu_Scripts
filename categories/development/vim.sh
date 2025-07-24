#!/bin/bash

# Vim/Neovim Installation Script
# This script installs Vim and Neovim with useful plugins

set -e

echo "Installing Vim and Neovim..."

# Update package list
sudo apt update

# Install Vim and Neovim
sudo apt install -y vim neovim

# Install dependencies for plugins
sudo apt install -y git curl nodejs npm python3-pip

# Install vim-plug for Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Create Neovim config directory
mkdir -p ~/.config/nvim

# Create basic Vim configuration
cat > ~/.vimrc << 'EOF'
call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Basic settings
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrap
set linebreak
set mouse=a

" Key mappings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>

" Color scheme
colorscheme desert
EOF

# Create Neovim configuration (symlink to vim config)
ln -sf ~/.vimrc ~/.config/nvim/init.vim

# Install Python support for Neovim
pip3 install --user pynvim

# Verify installation
vim --version | head -n 1
nvim --version | head -n 1

echo "Vim and Neovim installed successfully!"
echo "Vim version: $(vim --version | head -n 1)"
echo "Neovim version: $(nvim --version | head -n 1)"
echo "Configuration files created with essential plugins"
echo "Run ':PlugInstall' in Vim/Neovim to install plugins"
