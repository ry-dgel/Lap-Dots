"Syntax Highlighting
syntax on
"Play nice with buffers
set hidden

"Nicer Word Wrapping
set linebreak

"Line Break Travelling
set whichwrap=b,s,<,>,[,]

"Wrapped Line Travelling noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"Line Numbers
set number
set relativenumber
"Remove Normal Mode Lag set ttimeoutlen=50

"filetype Detection
filetype indent plugin on

"Encoding
set encoding=utf-8

"Auto detect outside changes
set autoread

"Show Current Position
set ruler

"highlight 80
set colorcolumn=80

"Height of command Bar
set cmdheight=2

"Hide Buffers
set hid

"Nice Backspace
set backspace=eol,start,indent

"Better Search
set ignorecase
set smartcase
set hlsearch
set incsearch

"Matching Brackets
set showmatch
set mat=2

"Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set autoindent

"Cursor Highlight
hi CursorLine  cterm=NONE ctermbg=0 ctermfg=NONE guibg=NONE guifg=NONE
hi CursorColumn  cterm=NONE ctermbg=0 ctermfg=NONE guibg=NONE guifg=NONE
nnoremap <Leader>r :set cursorline! cursorcolumn!<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Vim Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'neomake/neomake'
Plug 'ervandew/supertab'
call plug#end()

"Colors
set termguicolors
"let g:gruvbox_termcolors=16
set background=dark
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox

"Fix Transparancy
function! AdaptColorscheme()
	highlight clear CursorLine
	highlight Normal ctermbg=none guibg=none
	highlight LineNr ctermbg=none guibg=none
	highlight Folded ctermbg=none guibg=none
	highlight NonText ctermbg=none guibg=none
	highlight SpecialKey ctermbg=none guibg=none
	highlight VertSplit ctermbg=none guibg=none
	highlight SignColumn ctermbg=none guibg=none
endfunction

autocmd VimEnter * call AdaptColorscheme()


"Airline
"get rid of line percent
let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L%#__restore__# :%3v'
let g:airline_powerline_fonts = 0
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '▓'
let g:airline_left_sep = '▓'
let g:airline_right_sep = '▓'
let g:airline#extensions#neomake#enabled = 1

"Deoplete:
let g:deoplete#enable_at_startup = 1
"set tab to complete and cycle
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"NeoMake:
call neomake#configure#automake('nw', 1000)

"NerdTree:
map <C-Bslash> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Trying out buffers:
set switchbuf=usetab,newtab
