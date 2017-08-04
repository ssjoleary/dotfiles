" Settings
set nocompatible
syntax on
filetype plugin indent on
set number
set noswapfile
set splitright
set splitbelow
set laststatus=2
set cursorline
set clipboard=unnamed
set term=screen-256color

" Set shorter update time for GitGutter
set updatetime=250

set expandtab
set shiftwidth=2
set softtabstop=2

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'

Plug 'eapache/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }

Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'

Plug 'airblade/vim-gitgutter'

Plug 'rakr/vim-two-firewatch'
Plug 'cocopon/iceberg.vim'

Plug 'vim-scripts/dbext.vim',                      { 'for': 'sql' }

Plug 'bitc/vim-bad-whitespace'
Plug 'breuckelen/vim-resize'
Plug 'kshenoy/vim-signature'

Plug 'christoomey/vim-tmux-navigator'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-terraform'
Plug 'diepm/vim-rest-console'

call plug#end()

set exrc

" color
set background=dark
let g:airline_theme='twofirewatch'
colo iceberg

" Better Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" Mappings

let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","

" Toggle Whitespace
nmap <leader>sw :ToggleBadWhitespace<CR>

" Delete Whitespace
nmap <leader>dw :EraseBadWhitespace<CR>

" Window Splits
nmap <leader>v :vs<CR>
nmap <leader>b :sp<CR>

" Clear search highlight
nmap <leader><CR> :nohl<CR>

" Movement between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Handle common typos
command! W :w
command! Wa :wa
command! Wq :wq
command! Wqa :wqa
command! E :e

" Tab-complete
imap <tab> <C-n>
imap <S-tab> <C-p>

" Ctrlp
nmap <leader><space> :CtrlP<CR>

" Ack
nmap <leader>f :Ack 

" NERDTree
let g:NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
nmap <leader>n :NERDTree<CR>

noremap <left> :echo "no you don't"<cr>
noremap <right> :echo "no you don't"<cr>
noremap <up> :echo "no you don't"<cr>
noremap <down> :echo "no you don't"<cr>

" Split screen & go to source
nmap <leader>sv :vs<cr><Plug>FireplaceEditFile<cr>
nmap <leader>sb :sp<cr><Plug>FireplaceEditFile<cr>

" Syntax support for JSX in .js files, mxw/vim-jsx
let g:jsx_ext_required = 0

"ALE Linting
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
