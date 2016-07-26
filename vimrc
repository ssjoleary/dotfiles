" Settings
set number
set noswapfile
set splitright
set splitbelow
set laststatus=2
set cursorline

" color
colors zenburn 

" pathogen
execute pathogen#infect()
execute pathogen#helptags()

" vim-clojure-static
filetype plugin indent on
syntax on

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

" Delete Buffer
nmap <leader>d :bn\|bd #<CR>

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

" NERDTree
let g:NERDTreeWinPos="left"
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
nmap <leader>n :NERDTree<CR>
