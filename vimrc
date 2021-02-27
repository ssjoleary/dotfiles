" Settings
"if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  set termguicolors
"endif
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

"let g:ale_disable_lsp = 1

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'itchyny/landscape.vim'

Plug 'preservim/nerdtree'

Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-sensible'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',                               { 'do': './install --bin' }

Plug 'SevereOverfl0w/vim-replant',                 { 'for': 'clojure', 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni',                 { 'for': 'clojure' } " autocomplete
"Plug 'clojure-vim/vim-jack-in',                    { 'for': 'clojure' }

Plug '/Users/ssjoleary/repos/workspace/vim-clojure-highlight'
Plug 'tpope/vim-dispatch'
"Plug 'radenling/vim-dispatch-neovim'

" Python
Plug 'python-mode/python-mode',                    { 'for': 'python','branch': 'develop' }

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim',                          { 'for': ['clojure', 'javascript'], 'branch': 'release' }

Plug 'luochen1990/rainbow'
Plug 'clojure-vim/clojure.vim', { 'for': 'clojure' }

call plug#end()

set exrc

" color
syntax enable
colorscheme landscape
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

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

" NERDTree
let g:NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
nmap <leader>n :NERDTree<CR>

" vim-sexp
let g:sexp_enable_insert_mode_mappings = 1

let g:clojure_align_multiline_strings = 1
let g:clojure_maxlines = 1000
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defroutes", "GET", "POST", "PUT", "DELETE", "context"],
    \ 'clojureFunc': ["sql/defsql", "response/response", "s/Int", "t/Language", "s/constrained", "s/enum", "s/Str", "s/optional-key"]
    \ }
let g:clojure_special_indent_words = 'GET,POST,PUT,DELETE,defroutes,context,deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'

let g:vimwiki_list = [
      \ {'path': '~/vimwiki/work/journal', 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/vimwiki/personal', 'syntax': 'markdown', 'ext': '.md'}
      \]

nmap <leader>lcr :Start! lein do clean, repl<CR>
nmap <leader>lct :Start lein do clean, test<CR>
nmap <leader>lcdr :Start! lein do clean, docker-compose, repl<CR>
nmap <leader>lyd :Start yarn dev-staging<CR>

nmap <leader>rtf :ReplantTestProject +failed<CR>

" nvim terminal mode
:tnoremap <C-n> <C-\><C-n>

" COC
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

command! -nargs=0 Format :call CocAction('format')

"let g:coc_enable_locationlist = 0
"autocmd User CocLocationsChange CocList --normal location

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [l <Plug>(coc-diagnostic-prev)
nmap <silent> ]l <Plug>(coc-diagnostic-next)
nmap <silent> [k :CocPrev<cr>
nmap <silent> ]k :CocNext<cr>
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

" Highlight symbol under cursor on CursorHold      
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Remap keys for gotos
nmap <leader>crdf <Plug>(coc-definition)
nmap <leader>crrf <Plug>(coc-references)
nmap <leader>crrn <Plug>(coc-rename)

nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcp :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-privacy', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cris :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'inline-symbol', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
