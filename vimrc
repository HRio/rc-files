set nocompatible
set ruler
set history=50
set showcmd
set showmode
set incsearch
set nohlsearch
set nowrap
set textwidth=0
set mousehide
set number
set vb t_vb=
set autoindent smartindent
"set expandtab
set smarttab
set tabstop=8
set shiftwidth=8
set backspace=eol,start,indent
set undolevels=1000
set updatecount=100
set complete=.,w,b,u,U,t,i,d
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
syntax on
filetype plugin indent on
filetype plugin on
color darkblue
"set guifont=Andale\ Mono\ 9
set guioptions=agimt
set go-=m go-=T
set noequalalways

let Tlist_Display_Prototype = 1
let JavaBrowser_Expand_Tree_At_Startup = 1

imap <C-H> <Left>
imap <C-L> <Right>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-P> <Esc>pa
imap <C-E> \emph{}<Esc>i
map <Tab> ==
map <F6> :se number!<CR>
map <F7> :set hlsearch!<CR>
map <C-C> :s/\(\S\)/#\1/<CR>
map <S-C> :s/#\(.\)/\1/<CR>
map <CS-J> Jx
map ö <C-W>
map <ACS-C> :%s/\n\s*{/ {/<CR>
