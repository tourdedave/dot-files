"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""           INIT            	   """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle doesnt support fish
set shell=/bin/bash

" Neovim Python integration
let g:python_host_prog = "/usr/local/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3"

set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=UTF-8             " Set utf8 as standard encoding

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""           PLUGINS             """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Core Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'RRethy/vim-illuminate'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'joshdick/onedark.vim'
Plugin 'ryanoasis/vim-devicons'
"Plugin 'ternjs/tern_for_vim'

" Neovim plugins
if has('nvim')
  Plugin 'Shougo/deoplete.nvim'
"  Plugin 'carlitux/deoplete-ternjs'
endif

" Language bindings
Plugin 'dag/vim-fish'
Plugin 'plasticboy/vim-markdown'
Plugin 'itchyny/vim-gitbranch'
Plugin 'pangloss/vim-javascript'
Plugin 'sheerun/vim-polyglot'
Plugin 'prettier/vim-prettier'
Plugin 'mxw/vim-jsx'

" All plugins must be added before this line
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND = 'ag --ignore node_modules -g ""'
map <C-f> :FZF<CR>
map <C-p> :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules', '\.git$', '\.hg$']
map <C-x> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd FileType markdown let g:deoplete#enable_at_startup=0
  let g:deoplete#file#enable_buffer_path = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_virtualtext_cursor = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascript.jsx': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1
nmap <leader>pr :Prettier<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Silver Searcher (ag)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

nnoremap K :grep! "\b<C-R>/\b"<CR>:cw<CR><CR> " bind K to grep the last search term

set switchbuf=useopen
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>:cclose<CR>
augroup vimrcQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SuperTab
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Set airline font
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts (onedark)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colorscheme onedark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Key mapping for buffer traversal
map ' :bn<CR>
map " :bp<CR>
map { :bn<CR>
map } :bp<CR>
map Q :bd<CR>

" Allow unsaved files in buffer when switching
set hidden

" Close all buffers but the current one
command On execute "%bd|e#|bd#"
