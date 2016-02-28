" Here we go, this is my
"""""""""""""""""""""""""""""""""""""""
"          _                          "
"   __   _(_)_ __ ___  _ __ ___       "
"   \ \ / / | '_ ` _ \| '__/ __|      "
"    \ V /| | | | | | | | | (__       "
"     \_/ |_|_| |_| |_|_|  \___|      "
"                                     "
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""
"      TODO       "
"""""""""""""""""""

" - NERDTree opens a new file in hsplit when Startify is on
" - Improve Tern support
" - Improve CSS/HTML linting and formatting
" - Unicode emoji seem to be broken on my machine
" - HTML/JSX tag autoclosing
" - cwd is behaving weirdly with tabs and not autoupdated on buffer change
" - Flow support is broken

"""""""""""""""""""
"     GENERAL     "
"""""""""""""""""""

  " my leader key
  let mapleader = ','

  " super long history
  set history=1000

  " bash for better compatibility
  set shell=/bin/bash

  " I don't use backup
  set nobackup

  " and swap files are annoying
  set noswapfile

  " correct encoding
  set encoding=utf-8

  if has('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
  endif

  " autoreload vimrc on save
  augroup reload_vimrc
      autocmd!
      autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup END

  " session options
  set ssop-=options
  set ssop-=folds
  set ssop+=tabpages

"""""""""""""""""""
"     PLUGINS     "
"""""""""""""""""""

call plug#begin('~/.vim/plugged')

  " Colorschemes
  Plug 'flazz/vim-colorschemes'

  " better session management
  Plug 'xolox/vim-session'
    " Disable all session locking
    let g:session_lock_enabled = 0
    let g:session_autoload = 'no'

    map <Leader>ss :SaveSession 
    map <Leader>sc :CloseSession<CR>:Startify<CR>
    map <Leader>so :OpenSession 
    map <Leader>sd :DeleteSession 

  " better start screen
  Plug 'mhinz/vim-startify'
    let g:startify_bookmarks = [ '~/.vimrc', '~/.zshrc' ]
    let g:startify_session_dir = '~/.vim/sessions'
    let g:startify_list_order = [
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   Recently used:'],
            \ 'files',
            \ ]
    let g:startify_custom_header =
          \ map(split(system('fortune | cowthink -f tux'), '\n'), '"   ". v:val') + ['']

  " NerdTree
  Plug 'scrooloose/nerdtree'
    " auto start nerdtree and startify
    autocmd vimenter * if !argc() | Startify | NERDTree | wincmd w | endif

    " Auto close if only window is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    let NERDTreeShowBookmarks=0
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.DS_Store']
    let NERDTreeChDirMode=2
    let NERDChristmasTree = 1
    let NERDTreeQuitOnOpen=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=0
    let NERDTreeShowLineNumbers=0

    map <C-e> :NERDTreeToggle<CR>
    map <C-n> :NERDTreeFind<CR>

  " UndoTree
  Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
    nnoremap <Leader>u :UndotreeToggle<CR>
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1

  " better tab bar
  Plug 'fweep/vim-tabber'
  set tabline=%!tabber#TabLine()

  " better looking statusline
  Plug 'bling/vim-airline'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_powerline_fonts=1

    " old vim-powerline symbols
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'

  " Autoformat using different tools
  Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }
    nmap <Leader>f :Autoformat<CR>
    let g:formatdef_jscs = '"jscs -x -c ~/.lint/jscs.json"'
    let g:formatters_javascript = ['jscs']

  " search with ag/ack inside vim
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
      nmap <leader>ag :Ack! 

  " great motion helper for jumping quickly
  Plug 'Lokaltog/vim-easymotion'

  " Display git infos inside vim
  Plug 'tpope/vim-fugitive'

  " Easy commenting
  Plug 'scrooloose/nerdcommenter'

  " Autoalign things by character
  Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

  " display git diff info on the side of a file
  Plug 'airblade/vim-gitgutter'
      " https://github.com/airblade/vim-gitgutter/issues/106
      let g:gitgutter_realtime = 0

  " useful for working with marks
  Plug 'kshenoy/vim-signature'

  " autoclose brackets
  Plug 'jiangmiao/auto-pairs'

  " extended % matching
  Plug 'tmhedberg/matchit'

  " Easily change brackets and other surrounding things
  Plug 'tpope/vim-surround'

  " required by vim-session
  Plug 'xolox/vim-misc'

  " display indent guides
  Plug 'nathanaelkane/vim-indent-guides'
    "let g:indent_guides_auto_colors = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1

  " Syntastic
  Plug 'scrooloose/syntastic'
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_enable_signs=1
    let g:syntastic_error_symbol = "✗"
    let g:syntastic_warning_symbol = "⚠"
    let g:syntastic_always_populate_loc_list = 0
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    " Coffeescript
    let g:syntastic_coffee_checkers = ['coffeelint']
    let g:syntastic_coffee_coffeelint_args="--reporter csv --file ~/.lint/coffeelint.json"

    " HTML
    let g:syntastic_html_checkers = ['tidy']

    " JS
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_exec = 'eslint_d'
    let g:syntastic_javascript_eslint_args = "-c ~/.lint/eslint.json"

    " C++
    let g:syntastic_cpp_compiler = 'clang++'

    " Go
    let g:syntastic_go_checkers = ['go', 'golint']

  " Programming Languages

    " Javascript
        Plug 'elzr/vim-json', { 'for': 'json' }
        Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
        Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
        autocmd BufNewFile,BufRead *.jsx set filetype=javascript
        autocmd BufNewFile,BufRead *.cjsx set filetype=coffee

    " CSS
        Plug 'gorodinskiy/vim-coloresque'
        Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
        Plug 'groenewege/vim-less', { 'for': 'less' }
        Plug 'wavded/vim-stylus', { 'for': 'stylus' }
        Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }

    " Markup
        Plug 'tpope/vim-haml', { 'for': 'haml' }
        Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
        Plug 'cespare/vim-toml', { 'for': 'toml' }

    " Erlang
        Plug 'jimenezrick/vimerl', { 'for': 'erlang' }

    " Elixir
        Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

    " Clojure
        Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

    " Rust
        Plug 'wting/rust.vim', { 'for': 'rust' }

    " Rust
        Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

    " Dart
        Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

    " F#
        Plug 'kongo2002/fsharp-vim', { 'for': 'fsharp' }

    " Julia
        Plug 'JuliaLang/julia-vim'

    " Go
       Plug 'fatih/vim-go', { 'for': 'go' }
       " disable fmt on save
       let g:go_fmt_autosave = 0
       let g:go_fmt_fail_silently = 1

  " Autocompletion
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --racer-completer' }
    set completeopt-=preview
    let g:ycm_rust_src_path = '/Users/johann/Development/Projects/rust/src/'

  " Tern for JS
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

call plug#end()

"""""""""""""""""""
"  LOOK AND FEEL  "
"""""""""""""""""""

  " Fix Linux Terminal Issues
  set t_Co=256

  set background=dark
  colorscheme hybrid
  syntax on

  " better syntastic highlight colors
  highlight SyntasticErrorSign guifg=#ff0000 guibg=NONE
  highlight SyntasticStyleWarningSign guifg=#ffff00 guibg=NONE

  " clear small side column for compat with colorscheme
  highlight clear SignColumn

  " Font to use
  set guifont=Inconsolata-dz\ for\ Powerline:h12

  " Disable cursor blink
  set gcr=a:blinkon0

  " How anyone who's not deaf can have this turned off is beyond me
  set visualbell

  " shorter messages
  set shortmess+=filmnrxoOtTA

  " show commands as you type
  set showcmd

  " no scrollbar
  set guioptions-=rL

  set guioptions-=e

  " Puts new vsplit windows to the right of the current
  set splitright

  " Puts new split windows to the bottom of the current
  set splitbelow

  " Hide the mouse cursor while typing
  set mousehide

  " show line numbers
  set nu

  " better backspace behaviour
  set backspace=indent,eol,start

  " Highlight current line
  " set cursorline

  " don't ask for saving when switching buffers
  set hidden

  " seems to make things faster on terminals
  set ttyfast
  "set lazyredraw
  set re=1

  " Minimum lines to keep above and below cursor
  set scrolloff=7

  " Case insensitive search
  set ignorecase

  " Case sensitive when uc present
  set smartcase

  " Find as you type search
  set incsearch

  " Highlight search terms
  set hlsearch

  " show the current mode
  set noshowmode

"""""""""""""""""""
" CODE FORMATTING "
"""""""""""""""""""

  " Automatically detect file types.
  filetype plugin indent on

  " Indent at the same level of the previous line
  set autoindent

  " Indents are 2 spaces
  set shiftwidth=2

  " Spaces not tabs
  set expandtab

  " An indentation every four columns
  set tabstop=2

  " Let backspace delete indent
  set softtabstop=2

  " Prevents inserting two spaces after punctuation on a join (J)
  set nojoinspaces

  " Highlight problematic whitespace
  set list
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:.


"""""""""""""""""""
"   KEY MAPPINGS  "
"""""""""""""""""""

  "arrow keys move between windows
  noremap   <Up>     <C-w><C-k>
  noremap   <Down>   <C-w><C-j>
  noremap   <Left>   <C-w><C-h>
  noremap   <Right>  <C-w><C-l>

  " MacVim only: map CMD + num to trigger tabs
  noremap <D-1> 1gt
  noremap <D-2> 2gt
  noremap <D-3> 3gt
  noremap <D-4> 4gt
  noremap <D-5> 5gt
  noremap <D-6> 6gt
  noremap <D-7> 7gt
  noremap <D-8> 8gt

  noremap <D-Left> gT
  noremap <D-Right> gt

  " Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

  " Map space to play back the q macro
  nnoremap <Space> @q

  " Yank to + register with Y
  vnoremap Y "+y

  " Wrapped lines goes down/up to next row, rather than next line in file.
  noremap j gj
  noremap k gk

  " easier noop register
  noremap §  "_

  " Map <C-L> (redraw screen) to also turn off search highlighting until the
  " next search
  nnoremap <C-L> :nohl<CR><C-L>

