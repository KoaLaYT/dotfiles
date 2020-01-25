" [1] plugins {{{

" [1.1] Gundo {{{
nnoremap <leader>uu :GundoToggle<CR>            " toggle gundo
" }}}

" }}}

" [2] colors {{{
syntax enable
set background=dark
colorscheme solarized
" }}}

" [3] spaces & tabs {{{
set tabstop=4		" number of visual space per TAB
set softtabstop=4 	" number of spaces in tab when editing
set expandtab		" tabs are spaces
" }}}

" [4] UI config {{{
set number		    " show line numbers
set relativenumber  " show relative line numbers
set showcmd		    " show command in bottom bar
set cursorline		" highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]
" }}}

" [5] searching {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" }}}

" [6] folding {{{
set foldenable              " enable folding
set foldlevelstart=10       " open most folds by default
set foldnestmax=10          " 10 nested fold max
nnoremap <SPACE> za         " <space> open/closes folds
set foldmethod=marker
set foldlevel=0
set modelines=1
" }}}

" [7] key mappings {{{
let mapleader = ","

nnoremap <leader>ev :tabnew ~/.vimrc<CR>        " open .vimrc for editing
nnoremap <leader>sv :source ~/.vimrc<CR>        " source .vimrc for new configuration to take effect

inoremap jk <ESC>                               " changing esc to jk, for return to normal mode
inoremap <ESC> <NOP>

inoremap <LEFT> <NOP>                           " no arrow key for moving cursor
inoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>

nnoremap j gj                                   " move vertically by visual line
nnoremap k gk

nnoremap gV `[v`]                               " highlight last inserted text
" }}}

" vim:foldmethod=marker:foldlevel=0
