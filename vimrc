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

" FZF integration
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" set leader key
let mapleader = ","

" customize characters
set expandtab
set tabstop=2
set shiftwidth=2
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

" FZF key bindings
map <C-f> :FZF<CR>
map <C-p> :FZF<CR>

" NERDTree customizations
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1

" Ignore case when searching
set ignorecase

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

" Set color scheme
let g:onedark_termcolors = 16
colorscheme onedark

" status bar config
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='onedark'

" code complete with deoplete
let g:deoplete#enable_at_startup = 1
autocmd FileType markdown let g:deoplete#enable_at_startup=0
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#file#enable_buffer_path = 1

" JS code folding by syntax
"augroup javascript_folding
"  au!
"  au FileType javascript setlocal foldmethod=syntax
"augroup END

" Save & load code folding from previously opened files
"autocmd BufWinLeave *? silent! mkview
"autocmd BufWinEnter *? silent! loadview

" lightline config
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

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
nmap <leader>pr :Prettier<CR>

