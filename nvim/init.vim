call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'simeji/winresizer'
    Plug 'simnalamburt/vim-mundo'
call plug#end()

" Allows you to paste files in
set clipboard +=unnamedplus

" no swap file
set noswapfile

let mapleader =","

" save undo-trees in file
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" set line number
set number

" use 4 spaces instead of tab
" copy indent from current line when starting new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;name tab

let g:winresizer_start_key = "<leader>w"
