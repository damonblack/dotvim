set nocompatible
filetype on
filetype plugin on
filetype indent on
nnoremap <silent> <F8> :TlistToggle<CR>
setlocal shiftround

" crtl-p settings

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/.jhw-cache/*
set wildignore+=*/*.js.coffee.js
set wildignore+=*/*.js.js

call pathogen#infect()
call pathogen#helptags()

set t_Co=256

let mapleader = ","

set tabstop=2
set shiftwidth=2
set expandtab
set foldmethod=indent
set tags=tmp/tags

set nobackup
set noswapfile

"incrementally search file"
set incsearch

"put filename in title bar"
set title

"allow backspacing over everything in INSERT mode
set bs=2

"search for files like bash"
set wildmode=list:longest

" autosave if I switch to another buffer
set autowrite

"move swp files into .vim-tmp/"
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

nnoremap ; :

map <leader>e :e#<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>f :FuzzyFinderFile<CR>
map <leader>s :%s/

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Split screen vertically and move between screens.
map <leader>t <C-P>
map <leader>v :vsp<CR>
map <leader>h h
map <leader>j j
map <leader>k k
map <leader>l l
map <leader>> l
map <leader>< h
map <leader>= =
map <silent>mm :set paste<CR>m`o<Esc>``:set nopaste<CR>j
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><CR> :noh<CR><CR>

au FilterWritePre * call DiffWrap()
fun DiffWrap()
  if &diff
    windo set wrap
  endif
endfun


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

" Run Ruby unit tests with gT (for all) or gt (only test under
" cursor) in command mode
augroup RubyTests
  au!
  autocmd BufRead,BufNewFile *_test.rb,test_*.rb
    \ :nmap gt V:<C-U>!$HOME/.vim/bin/ruby-run-focused-unit-test
    \ % <C-R>=line("'<")<CR>p <CR>|
    \ :nmap gT :<C-U>!testdrb %<CR>
  autocmd BufRead,BufNewFile *_spec.rb
    \ :nmap gs V:<C-U>!$HOME/.vim/bin/ruby-run-focused-spec
    \ % <C-R>=line("'<")<CR>p <CR>|
    \ :nmap gS :<C-U>!bundle exec rspec %<CR>
augroup END

set ai
set isk=@,48-57,_,?,!,192-255

" From nat's file
set nu
set showtabline=2

nmap <leader>, :tabnew<CR>
nmap <leader>. :tabnext<CR>
nmap .<leader> :tabpre<CR>

set shortmess=atI

colorscheme desert

if v:version > '702'
  set colorcolumn=80
endif
