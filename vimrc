set encoding=UTF-8            " Set utf8 as standard encoding

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""           PLUGINS             """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'joshdick/onedark.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb' " for :GBrowse to work

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules'

" nerdtree
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40
let NERDTreeIgnore=['node_modules', '\.git$', '\.hg$']
map <C-x> :NERDTreeToggle<CR>

" airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" onedark
set t_Co=256
colorscheme onedark
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Put your non-Plugin stuff after this line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""           GENERAL             """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key bindings for pane navigation
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <c-h> <c-w>h<c-w>_
map <c-l> <c-w>l<c-w>_

" set leader key
let mapleader = ","

" Hope I don't need to type the name JJ Abrams
imap jj <Esc>

" enable syntax highlighting
syntax on

" customize characters
set smarttab		" turn on smart tab behavior
set expandtab 		" convert tabs to spaces
set tabstop=2		" how many columns of whitespace a \t char worth
set shiftwidth=2	" how many columns of whitespace a level of indentation is worth
set softtabstop=2	" how many columns of whitespace a tab or backspace keypress is worth

" Key mapping for buffer traversal
map ' :bn<CR>
map " :bp<CR>
map { :bn<CR>
map } :bp<CR>
map Q :bd<CR>
set hidden " to allow traversing when buffer has been modified but not saved

" Go
let g:go_fmt_command = "goimports"    " format with goimports instead of gofmt

" highlight search results
set hlsearch

" yank to system clipboard
set clipboard=unnamed

" enable mouse select (doesn't select between tabs, but will open files)
set mouse=a

" enable line numbers in left margin
set number
