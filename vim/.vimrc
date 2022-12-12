filetype indent plugin on
syntax on

set nocompatible

set autoread
au FocusGained,BufEnter * checktime

set nobackup
set noswapfile
set noundofile

set noerrorbells
set novisualbell

set backspace=2
set lazyredraw
set number
set showmode
set showmatch

set ignorecase
set smartcase
set hlsearch
set incsearch

set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype json setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype jsonc setlocal tabstop=2 softtabstop=2 shiftwidth=2
