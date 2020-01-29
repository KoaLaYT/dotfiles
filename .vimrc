let mapleader = ","

" [1] plugins {{{

" [1.1] gundo {{{
nnoremap <leader>uu :GundoToggle<CR>            " toggle gundo
" }}}

" [1.2] lightline {{{
set noshowmode        " hiden the default --INSERT-- 
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" }}}

" [1.3] asyncomplete {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" }}}

" [1.4] lsp {{{
let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

augroup lsp_setup
    autocmd!
    " auto format on save c/c++ files
    autocmd BufWritePre *.h,*.cc,*.cpp LspDocumentFormat
    " use clangd for c/c++
    if executable('clangd')
        autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd', '-background-index']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ })
    endif
augroup END

" lazy loading lsp
command! IDE
    \   packadd async
    \ | packadd vim-lsp
    \ | packadd asyncomplete
    \ | packadd asyncomplete-lsp
    \ | source $MYVIMRC
    \ | call lsp#enable()

" key bindings
nnoremap <leader>h :LspHover<CR>
nnoremap <leader>e :LspDocumentDiagnostics<CR>
" }}}

" }}}

" [2] colors {{{
syntax enable
set background=dark
colorscheme solarized
" }}}

" [3] spaces & tabs {{{
set tabstop=2		" number of visual space per TAB
set softtabstop=2 	" number of spaces in tab when editing
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

" [7.1] auto closing
inoremap {<CR> {<CR>}<ESC>O
" }}}

" [8] auto indent {{{
set autoindent
" }}}

" [9] backspace {{{
set backspace=2 " make backspace working normal
" }}}

" vim:foldmethod=marker:foldlevel=0
