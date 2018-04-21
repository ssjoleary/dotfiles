" Settings
if !has('nvim')
  set term=screen-256color
  set nocompatible
  filetype plugin indent on
  syntax on
endif
if has('nvim')
  set termguicolors
endif
set number
set noswapfile
set splitright
set splitbelow
set laststatus=2
set cursorline

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
Plug 'SevereOverfl0w/vim-replant',                 { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'

Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }

Plug 'vim-syntastic/syntastic',                    { 'for': 'clojure' }
Plug 'venantius/vim-eastwood',                     { 'for': 'clojure' }
Plug 'eraserhd/parinfer-rust'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'rakr/vim-two-firewatch'
Plug 'jacoborus/tender.vim'

Plug 'vim-scripts/dbext.vim',                      { 'for': 'sql' }

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

set exrc

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" color
set background=dark
colorscheme tender
let g:airline_theme='tender'

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
nmap <leader>f :Ack! 

" NERDTree
let g:NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
nmap <leader>n :NERDTree<CR>

" Split screen & go to source
nmap <leader>sv :vs<cr><Plug>FireplaceEditFile<cr>
nmap <leader>sb :sp<cr><Plug>FireplaceEditFile<cr>

nnoremap <leader>M <C-W>\| <C-W>_
nnoremap <leader>m <C-W>=

" vim-sexp
let g:sexp_enable_insert_mode_mappings = 0
