" vim: set sw=4 ts=4 sts=4 et tw=78 foldmethod=marker:

" {{{ vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vinarise'
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'YankRing.vim'
Bundle 'benmills/vimux'
Bundle 'bufexplorer.zip'
Bundle 'clang-complete'
Bundle 'dahu/LearnVim'
Bundle 'ervandew/supertab'
Bundle 'fsouza/go.vim'
Bundle 'gmarik/vundle'
Bundle 'gnupg.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'matchit.zip'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vimlatex'
Bundle 'slimv.vim'
Bundle 'bitc/vim-hdevtools'
Bundle 'lukerandall/haskellmode-vim'

filetype plugin indent on
" }}}

" {{{ History
set autoread
set history=1000
set nobackup
set noswapfile
set nowb
set undodir=$HOME/.vim/backups
set undofile
set viminfo='20,\"50
" }}}

" {{{ Indention
set autoindent
set expandtab
set shiftround
set shiftwidth=3
set smartindent
set smarttab
set softtabstop=3
set tabstop=3
" }}}

" {{{ GUI related stuff 
colorscheme wombat256mod
set background=dark
set cursorline
set hidden
set laststatus=2
set lazyredraw
set noshowmode
set number
set ruler
set scrolloff=8
set showcmd
set t_Co=256
set title
set wildignore=*.o,*~,*.pyc
set wildmenu
set wrap
syntax enable
" }}}

" {{{ Keybindings 
let g:mapleader = ";"
let mapleader = ";"
map j gj
map k gk
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>s :VimShellTab<CR>
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
nnoremap <leader>w :w!<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>te :tabedit 
au FileType haskell nnoremap <buffer> <leader>ht :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <leader>hc :HdevtoolsClear<CR>

set backspace=indent,eol,start
set notimeout
set nottimeout
set pastetoggle=<F2>
set whichwrap+=<,>,h,l
" }}}

" {{{ Mouse
set mouse=a
" }}}

" {{{ Searching
set hlsearch
set ignorecase
set incsearch
set magic
set smartcase
" }}}

" {{{ Sound
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" }}}

" {{{ Misc
runtime! ftplugin/man.vim
set encoding=utf-8
set ffs=unix,dos,mac
set shell=/bin/mksh
let g:yankring_history_dir = '$HOME/.vim/'
autocmd! bufwritepost .vimrc source %
" }}}

" {{{ Lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename'
    \ }
    \ }
function! MyModified()
    return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
    return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
    if &ft !~? 'vimfiler' && exists("*fugitive#head")
        return fugitive#head()
    endif
    return ''
endfunction
" }}}

" {{{ cscope
if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif
" }}}

" {{{ LISP
let g:lisp_rainbow=1
" }}}

" {{{ Haskell
let g:haddock_browser="firefox"
" }}}
