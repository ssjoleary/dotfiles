" Settings
syntax on
filetype plugin indent on
set nocompatible
set number
set noswapfile
set splitright
set splitbelow
set laststatus=2
set cursorline
if $TMUX == ''
  set clipboard+=unnamed
endif
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

Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-salve',                            { 'for': 'clojure' }

Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }

Plug 'venantius/vim-cljfmt',                       { 'for': 'clojure' }

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'airblade/vim-gitgutter'

Plug 'rakr/vim-two-firewatch'
Plug 'cocopon/iceberg.vim'

Plug 'vim-scripts/dbext.vim',                      { 'for': 'sql' }

Plug 'breuckelen/vim-resize'

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

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"" Mappings

let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","

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

" Split screen & go to source
nmap <leader>sv :vs<cr><Plug>FireplaceEditFile<cr>
nmap <leader>sb :sp<cr><Plug>FireplaceEditFile<cr>

let g:vim_resize_disable_auto_mappings = 1

nnoremap <silent> <left> :CmdResizeLeft<cr>
nnoremap <silent> <down> :CmdResizeDown<cr>
nnoremap <silent> <up> :CmdResizeUp<cr>
nnoremap <silent> <right> :CmdResizeRight<cr>

" Syntax support for JSX in .js files, mxw/vim-jsx
let g:jsx_ext_required = 0

"ALE Linting
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
