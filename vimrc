" Settings
if !has('nvim')
  set term=screen-256color
  set nocompatible
  filetype plugin indent on
  syntax on
endif

au BufRead,BufNewFile *.md set cc=80

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'

" Plug 'aonemd/kuroi.vim'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-salve'
Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',                               { 'dir': '~/.fzf', 'do': './install --bin' }

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'SevereOverfl0w/vim-replant',                 { 'do': ':UpdateRemotePlugins' }
Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight',                 { 'for': 'clojure' }
Plug 'jrdoane/vim-clojure-highlight',              { 'for': 'clojure' }
Plug 'eraserhd/parinfer-rust',                     {'do': 'cargo build --release'}
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'Olical/conjure',                             { 'tag': 'v0.22.0', 'do': 'bin/compile'  }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'majutsushi/tagbar'
" Plug 'universal-ctags/ctags'
" Plug 'ludovicchabant/vim-gutentags'

" Python
Plug 'python-mode/python-mode',                    { 'for': 'python','branch': 'develop' }

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs', { 'for': 'javascript' }
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'

call plug#end()

let g:ale_linters = {'clojure': ['clj-kondo', 'joker']}
let g:ale_linters_explicit = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

set exrc

" color
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'
highlight Normal ctermbg=black

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"" Mappings

let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","

" Window Splits
nmap <leader>v :vs<CR>
nmap <leader>b :sp<CR>

nmap <leader>r :Start! lein repl<CR>
nmap <leader>cr :Start! lein do clean, repl<CR>
nmap <leader>cdr :Start! lein do clean, docker-compose, repl<CR>
nmap <leader>T :TagbarToggle<CR>

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
nmap <leader>f :Rg 
nmap <leader>ff :Rg <C-r><C-w><CR>

" NERDTree
let g:NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
nmap <leader>n :NERDTree<CR>

" vim-sexp
let g:sexp_enable_insert_mode_mappings = 0

let g:clojure_align_multiline_strings = 1
let g:rustfmt_autosave = 1
let g:vimwiki_list = [
      \ {'path': '~/vimwiki/work', 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/vimwiki/personal', 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1},
      \ {'path': '~/vimwiki/personal', 'syntax': 'markdown', 'ext': '.md'}
      \]
