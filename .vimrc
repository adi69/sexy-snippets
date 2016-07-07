" ---------------------------VUNDLE BEGIN -----------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline' " The Fancy Status Bar
Plugin 'vim-airline/vim-airline-themes' " fancy status bar themes

Plugin 'tomasr/molokai' " TextMate theme

Plugin 'davidhalter/jedi-vim' " Python autocompletion

call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------VUNDLE END -----------------------
set ignorecase
map <C-n> :NERDTreeToggle<CR>

" Enable syntax highlighting
syntax on

" show line numbers
set number

" do not comment next line automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

" let backspace delete indent
set softtabstop=4

" Show  tab characters. Visual Whitespace.
set list
set listchars=tab:>.

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Auto indent on next line
set autoindent

" Highlight search results
set hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=darkgrey

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" Sets how many lines of history VIM has to remember
set history=7000

" Use utf-8 by default
set encoding=utf-8

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <F3> :set nonumber!<CR>

" autocmd VimEnter * NERDTree

" Automatically set cwd to currently editing file
set autochdir

" show the file name in vim
set laststatus=2
set statusline+=%F
set statusline+=\ \ col:\ %c,

