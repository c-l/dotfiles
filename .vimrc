
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes' " adds various colorschemes
Plug 'godlygeek/csapprox' " fixes colorscheme issues
Plug 'tpope/vim-commentary' " adds commenting bindings

" Initialize plugin system
call plug#end()

colorscheme molokai

set relativenumber 
set number  

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" fixed problems with delete key not working on mac
set backspace=indent,eol,start 

let &t_Co=256 " have vim use 256 colors

" swap : and ; 
nnoremap ; :
nnoremap : ;

set mouse=a " enable mouse in vim
