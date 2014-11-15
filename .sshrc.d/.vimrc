set nocompatible        " Must be first line

let mapleader = ','

set shell=/bin/zsh

set shell=/bin/zsh
set background=dark         " Assume a dark background
set t_Co=256                " Fix Linux Terminal Issues
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set visualbell              " no sounds
set gcr=a:blinkon0          " disable cursor blink
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set nospell
scriptencoding utf-8

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=1                " Lines to scroll when cursor leaves screen
set ttyfast                     " seems to make things faster on terminals
set scrolloff=7                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
