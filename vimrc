" Settings
if !has('nvim')
  set term=screen-256color
  set nocompatible
  filetype plugin indent on
  syntax on
endif

" Set shorter update time for GitGutter
set updatetime=250
set number
set noswapfile
set cursorline
set expandtab
set shiftwidth=2
set tabstop=2
set t_Co=256
set clipboard+=unnamedplus

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',                               { 'dir': '~/.fzf', 'do': './install --bin' }

Plug 'Shougo/deoplete.nvim',                       { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'

Plug 'eraserhd/parinfer-rust',                     {'do': 'cargo build --release'}
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'luochen1990/rainbow'
Plug 'SevereOverfl0w/vim-replant',                 { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

Plug 'romainl/flattened'
Plug 'rakr/vim-two-firewatch'
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'srcery-colors/srcery-vim'

Plug 'w0rp/ale'

Plug 'python-mode/python-mode',                    { 'for': 'python','branch': 'develop' }

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

set exrc

" color
set background=dark
colorscheme srcery
let g:airline_theme='srcery'

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

" Tab-complete
imap <tab> <C-n>
imap <S-tab> <C-p>

" FZF
nmap <leader><space> :FZF <CR>
nmap <leader>f :Ag 

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

let g:clojure_align_multiline_strings = 1
