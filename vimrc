set shell=/bin/bash " Vundle doesnt support fish
" neovim/python integration
let g:python_host_prog = "/usr/local/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3"
set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf8             " Set utf8 as standard encoding

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

" Plugins
if has('nvim')
  Plugin 'Shougo/deoplete.nvim'
endif
Plugin 'w0rp/ale'
Plugin 'plasticboy/vim-markdown'
Plugin 'mgee/lightline-bufferline'
Plugin 'NovaDev94/lightline-onedark'
Plugin 'itchyny/lightline.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/vim-gitbranch'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'sheerun/vim-polyglot'
Plugin 'prettier/vim-prettier'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set leader key
let mapleader = ","

" customize characters
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set list
set list listchars=trail:·,eol:¬

" highlight all found entries
set hlsearch

" remove highlight
nnoremap <CR> :noh<CR>

" turn on vim's wild menu
set wildmenu

" make the wild menu case insensitive
set wildignorecase

" enable syntax highlighting
syntax on

" auto-read a file when it's changed from the outside
set autoread

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" key bindings for pane navigation
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <c-h> <c-w>h<c-w>_
map <c-l> <c-w>l<c-w>_

" Ignore case when searching
set ignorecase

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" When searching try to be smart about cases
set smartcase

" Prevent swp files from being rendered
set nobackup
set nowb
set noswapfile

" Key mapping for buffer traversal
map ' :bn<CR>
map " :bp<CR>
map { :bn<CR>
map } :bp<CR>
map Q :bd<CR>

" Allow unsaved files in buffer when switching
set hidden

" Remap ; to : to avoid needing to hit shift 'a-may-zing!'
nnoremap ; :

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" set color scheme
let g:onedark_termcolors = 16
colorscheme onedark

" FZF integration
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <C-f> :FZF<CR>
map <C-p> :FZF<CR>

" NERDTree customizations
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1

" deoplete
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd FileType markdown let g:deoplete#enable_at_startup=0
  let g:deoplete#file#enable_buffer_path = 1
endif

" tab and status line config
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\     'left':[ [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ]
\     ]
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\   }
\ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2
set guioptions-=e

" ale
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
nmap <leader>pr :Prettier<CR>

" Silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" bind K to grep the last search term
nnoremap K :grep! "\b<C-R>/\b"<CR>:cw<CR><CR>

set switchbuf=useopen
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>:cclose<CR>
augroup vimrcQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END
