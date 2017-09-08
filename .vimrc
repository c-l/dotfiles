" automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes' " adds various colorschemes
Plug 'godlygeek/csapprox' " fixes colorscheme issues
Plug 'tpope/vim-commentary' " adds commenting bindings
Plug 'tpope/vim-obsession' " continuously updates vim session files
Plug 'tpope/vim-vinegar' " directory browswer
Plug 'vim-scripts/Conque-GDB' " vim gdb integration
Plug 'nathanaelkane/vim-indent-guides' " show indent guides
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "code completion engine

" Initialize plugin system
call plug#end()

colorscheme molokai

" make the system clipboard the default copy and paste register
" need to check if this works when I get my own desktop
set clipboard=unnamedplus

set relativenumber 
set number  
set textwidth=100

let tabsize = 2
execute "set tabstop=".tabsize
execute "set softtabstop=".tabsize
execute "set shiftwidth=".tabsize
set expandtab " tabs will be expanded to spaces

" highlighting configuration
set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

let mapleader = ","

" Conque GDB settings
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 

let g:ConqueGdb_Leader = '<Leader>'
let g:ConqueGdb_VSplit = g:ConqueGdb_Leader . 'v'

" vim indent guide configuration
let g:indent_guides_enable_on_vim_startup = 1

