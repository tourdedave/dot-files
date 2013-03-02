" Quick key bindings to change as needed based on the work I'm doing
" map ; :!clear; ckit brew <Return>
" map ; :!clear; rake run TAGS=@alfresco <Return> # !> possibly useless use of a literal in void context
" map ; :!clear; rake run:wip <Return>
map ; :!clear; ruby % <Return>
" map ; :!clear; rspec --tag wip --format doc -c <Return>
" map ; :!clear; rspec --format doc -c <Return>
" map ; :!clear; bundle exec cucumber <Return>

set list
set listchars=trail:.,extends:#

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
