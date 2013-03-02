set list
set listchars=trail:.,extends:#

" map ; :!clear; ckit brew <Return>
" map ; :!clear; rake run TAGS=@alfresco <Return> # !> possibly useless use of a literal in void context
" map ; :!clear; rake run:wip <Return>
map ; :!clear; ruby % <Return>
" map ; :!clear; rspec --tag wip --format doc -c <Return>
" map ; :!clear; rspec --format doc -c <Return>
" map ; :!clear; bundle exec cucumber <Return>

colorscheme Tomorrow-Night-Eighties 
call pathogen#infect()

filetype on
syntax on

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <c-h> <c-w>h<c-w>_
map <c-l> <c-w>l<c-w>_

set tabstop=2 shiftwidth=2 expandtab
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set noequalalways
set helpheight=9999
set winminheight=0
set winheight=999


" XMPFilter config

" add annotation to a line
vmap <silent> <C-a> !xmpfilter -m<cr>
nmap <silent> <C-a> V<C-a>
imap <silent> <C-a> <ESC><C-a>a

" remove annotation from a line
vmap <silent> <C-a-r> ms:call RemoveRubyEval()<CR>
nmap <silent> <C-a-r> V<C-a-r>
imap <silent> <C-a-r> <ESC><C-a-r>a

" single line execution of # =>
map <silent> <C-r> !xmpfilter -a<cr>
nmap <silent> <C-r> V<C-r>
imap <silent> <C-r> <ESC><C-r>a

" whole buffer execution of # => 
nmap <silent> <C-r><C-r> mzggVG!xmpfilter -a<cr>'z
imap <silent> <C-r><C-r> <ESC><C-r>

" XMPFilter standard config

" plain annotations
" map <silent> <F10> !xmpfilter -a<cr>
" nmap <silent> <F10> V<F10>
" imap <silent> <F10> <ESC><F10>a

" Test::Unit assertions; use -s to generate RSpec expectations instead
" map <silent> <S-F10> !xmpfilter -u<cr>
" nmap <silent> <S-F10> V<S-F10>
" imap <silent> <S-F10> <ESC><S-F10>a

" Annotate the full buffer
" I actually prefer ggVG to %; it's a sort of poor man's visual bell 
" nmap <silent> <F11> mzggVG!xmpfilter -a<cr>'z
" imap <silent> <F11> <ESC><F11>

" assertions
" nmap <silent> <S-F11> mzggVG!xmpfilter -u<cr>'z
" imap <silent> <S-F11> <ESC><S-F11>a

" Add # => 
" vmap <silent> <F12> !xmpfilter -m<cr>
" nmap <silent> <F12> V<F12>
" imap <silent> <F12> <ESC><F12>a

" Remove # => 
" vmap <silent> <S-F12> ms:call RemoveRubyEval()<CR>
" nmap <silent> <S-F12> V<S-F12>
" imap <silent> <S-F12> <ESC><S-F12>a

"function! RemoveRubyEval() range
"  let begv = a:firstline
"  let endv = a:lastline
"  normal Hmt
"  set lz
"  execute ":" . begv . "," . endv . 's/\s*# \(=>\|!!\).*$//e'
"  normal 'tzt`s
"  set nolz
"  redraw
"endfunction
