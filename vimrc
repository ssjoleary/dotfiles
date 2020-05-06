" Settings
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
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

Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',                               { 'do': './install --bin' }

Plug 'guns/vim-clojure-static',                    { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'SevereOverfl0w/vim-replant',                 { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'

Plug 'jrdoane/vim-clojure-highlight',              { 'for': 'clojure' }
Plug 'luochen1990/rainbow'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"
" Python
Plug 'python-mode/python-mode',                    { 'for': 'python','branch': 'develop' }

Plug 'jiangmiao/auto-pairs', { 'for': 'javascript' }
Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim',                          {'branch': 'release'}

" wiki
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'

call plug#end()


let g:ale_linters = {'clojure': ['clj-kondo', 'joker']}
let g:ale_linters_explicit = 1

set exrc

" color
syntax enable
colorscheme tempus_winter
let g:airline_theme='deus'

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

" ripgrep
nmap <leader>s :Rg 
nmap <leader>ss :Rg <C-r><C-w><CR>

" replant
nmap <leader>rfs :ReplantFindSymbol<CR>
nmap <leader>rlr :ReplantListResources<CR>

" NERDTree
let g:NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
nmap <leader>n :NERDTree<CR>

" vim-sexp
let g:sexp_enable_insert_mode_mappings = 1

let g:clojure_align_multiline_strings = 1
let g:rustfmt_autosave = 1
let g:vimwiki_list = [
      \ {'path': '~/vimwiki/work/journal', 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/vimwiki/personal', 'syntax': 'markdown', 'ext': '.md'}
      \]

nmap <leader>lcr :Lein do clean, repl<CR>
nmap <leader>lct :Lein do clean, test<CR>
nmap <leader>lcdr :Lein do clean, docker-compose, repl<CR>
nmap <leader>lyd :Start yarn dev-staging:nice<CR>

" Color name (:help cterm-colors) or ANSI code
nmap <leader>gy :Goyo<CR>
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" nvim terminal mode
:tnoremap <Esc> <C-\><C-n>
