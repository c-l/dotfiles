
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes' " adds various colorschemes
Plug 'godlygeek/csapprox' " fixes colorscheme issues
Plug 'tpope/vim-commentary' " adds commenting bindings
Plug 'tpope/vim-obsession' " continuously updates vim session files

" Initialize plugin system
call plug#end()

colorscheme molokai

set relativenumber 
set number  
set textwidth=100

let tabsize = 2
execute "set tabstop=".tabsize
execute "set softtabstop=".tabsize
execute "set shiftwidth=".tabsize
set expandtab " tabs will be expanded to spaces

" Forces vim to obey spacing I want for Python
" http://stackoverflow.com/questions/21073496/why-does-vim-not-obey-my-expandtab-in-python-files 
function! SetupPython()
    let tabsize = 2
    execute "set tabstop=".tabsize
    execute "set softtabstop=".tabsize
    execute "set shiftwidth=".tabsize
endfunction
command! -bar SetupPython call SetupPython()

" fixed problems with delete key not working on mac
set backspace=indent,eol,start 

let &t_Co=256 " have vim use 256 colors

" swap : and ; 
nnoremap ; :
nnoremap : ;

set mouse=a " enable mouse in vim
