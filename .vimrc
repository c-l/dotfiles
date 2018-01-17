" automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" git
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'airblade/vim-gitgutter' " shows git diff information

" tmux
Plug 'christoomey/vim-tmux-navigator' " vim tmux

" navigation and search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' } " code completion engine
Plug 'ludovicchabant/vim-gutentags' " automatic ctags manager
Plug 'mileszs/ack.vim'

" C++
Plug 'vim-scripts/Conque-GDB' " vim gdb integration
Plug 'Chiel92/vim-autoformat'
" Plug 'rhysd/vim-clang-format' "clang formatter to format C++ code
Plug 'vim-scripts/DoxygenToolkit.vim' " doxygen comments

" Appearance
" Plug 'flazz/vim-colorschemes' " adds various colorschemes
Plug 'Yggdroot/indentLine' " show indent guides
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

" misc
Plug 'tpope/vim-obsession' " continuously updates vim session files
Plug 'tpope/vim-commentary' " adds commenting bindings
Plug 'tpope/vim-vinegar' " directory browswer
Plug 'ConradIrwin/vim-bracketed-paste' " automatic set paste

" Initialize plugin system
call plug#end()

" color scheme
set background=dark 
" let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox

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
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" " Press Space to turn off highlighting and clear any message already displayed.
" :nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>  
  
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

" let &t_Co=256 " have vim use 256 colors

" swap : and ; 
nnoremap ; :
nnoremap : ;

set mouse=a " enable mouse in vim

let mapleader="\<SPACE>"


" nnoremap <Tab> :bnext!<CR>
" nnoremap <S-Tab> :bprev!<CR><Paste>

" map control t to finding files with fzf
nnoremap <C-p> :Files <CR>
" find most recently modified files with fzf
nnoremap <C-t> :History<CR> 

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Conque GDB settings
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 

let g:ConqueGdb_Leader = '<Leader>'
let g:ConqueGdb_VSplit = g:ConqueGdb_Leader . 'v'

" vim indent guide configuration
let g:indent_guides_enable_on_vim_startup = 1

" setting the comment string to //
autocmd FileType c,cpp,cs,java          setlocal commentstring=//\ %s

" https://wrotenwrites.com/a_modern_terminal_workflow_2/
" indent guide config
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Ycm Goto
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" ninja make
set makeprg='ninja'

" autoformat
noremap <F3> :Autoformat<CR>

:nnoremap & :%s/\<<C-r><C-w>\>/

" Lightline configuration
set laststatus=2 " shows lightline
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo', 'percentage'],
  \              [ 'ycm_errors'],
  \              ['ycm_warnings'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'ycm_errors': 'youcompleteme#GetErrorCount',
  \   'ycm_warnings': 'youcompleteme#GetWarningCount'
  \ },
\ }
