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

" - Improve CSS/HTML linting and formatting
" - HTML/JSX tag autoclosing
" - cwd is behaving weirdly with tabs and not autoupdated on buffer change
" - Flow server needs to be started manually

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

  " Stronger Crypto
  set cm=blowfish2

  " and swap files are annoying
  set noswapfile

  " correct encoding
  set encoding=utf-8

  set timeoutlen=1000
  set ttimeoutlen=20

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

  " Use whole "words" when opening URLs.
  " This avoids cutting off parameters (after '?') and anchors (after '#'). 
  " See http://vi.stackexchange.com/q/2801/1631
  let g:netrw_gx="<cWORD>"

  " Spell checking for .md and .tex files
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.tex setlocal spell

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
    let g:session_autosave = 'no'

    noremap <Leader>ss :SaveSession 
    noremap <Leader>sc :CloseSession<CR>
    noremap <Leader>so :OpenSession 
    noremap <Leader>sd :DeleteSession 

  " NerdTree
  Plug 'scrooloose/nerdtree'
    " auto start nerdtree
    autocmd vimenter * if !argc() | NERDTree | wincmd w | endif

    " Auto close if only window is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let NERDTreeShowBookmarks=0
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.DS_Store']
    let NERDTreeChDirMode=2
    let NERDChristmasTree = 1
    let NERDTreeQuitOnOpen=0
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=0
    let NERDTreeShowLineNumbers=0

    noremap <C-e> :NERDTreeToggle<CR>
    noremap <C-n> :NERDTreeFind<CR>

  Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
      let $SKIM_DEFAULT_COMMAND = "git ls-tree -r --name-only HEAD || rg --files --glob '!{js/*,python/*,third_party/*}' || ag -l -g \"\" || fd ."
      noremap <c-p> :call ShowSkim()<CR>

      " Prevent Skim from opening in NERDTree windows
      function! ShowSkim()
        let c = 0
        let wincount = winnr('$')
        " Don't open it here if current buffer is not writable (e.g. NERDTree)
        while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
            exec 'wincmd w'
            let c = c + 1
        endwhile
        exec 'SK'
      endfunction

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
    let g:airline_powerline_fonts=0

    " old vim-powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

    let g:airline_section_c = '%t'
    let g:airline_section_x = '%{grepper#statusline()}'
    let g:airline_section_y = '%{pathshorten(getcwd())}'

  " Autoformat using different tools
  Plug 'Chiel92/vim-autoformat', { 'on': 'Autoformat' }
    noremap <Leader>f :CustomFmt<CR>

  function! CustomFormat()
    if &filetype == 'elm'
      ElmFormat
    elseif &filetype == 'rust'
      RustFmt
    elseif &filetype == 'javascript'
      Prettier
    else
      Autoformat()
    endif
  endfunction
  command! CustomFmt :call CustomFormat()

  Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

  " grep-like searcher using ripgrep
  Plug 'mhinz/vim-grepper'
  let g:grepper = {}
  let g:grepper.tools = ['rg']
  let g:grepper.rg = {}
  let g:grepper.rg.grepprg = 'rg -H --no-heading --vimgrep --smart-case'
  nnoremap <leader>ag :Grepper<cr>
  "nnoremap <leader>sg :Grepper -tool ag -side<cr>
  vmap <leader>ag <plug>(GrepperOperator)

  " better repeat operator
  Plug 'tpope/vim-repeat'

  " A thesaurus
  "Plug 'ron89/thesaurus_query.vim'
  "nnoremap <Leader>ts :ThesaurusQueryReplaceCurrentWord<CR>

  " Grammar checking
  "Plug 'rhysd/vim-grammarous'
  "let g:grammarous#disabled_rules = { 'tex' : ['WHITESPACE_RULE', 'EN_QUOTES', 'EN_UNPAIRED_BRACKETS',], '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'EN_UNPAIRED_BRACKETS',], }

  " great motion helper for jumping quickly
  Plug 'Lokaltog/vim-easymotion'

  " Display git infos inside vim
  Plug 'tpope/vim-fugitive'

  " Display mercurial infos inside vim
  Plug 'jlfwong/vim-mercenary'

  " Easy commenting
  Plug 'scrooloose/nerdcommenter'

  " Autoalign things by character
  Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
    nnoremap <Leader>a& :Tabularize /&<CR>
    vnoremap <Leader>a& :Tabularize /&<CR>
    nnoremap <Leader>a= :Tabularize /=<CR>
    vnoremap <Leader>a= :Tabularize /=<CR>
    nnoremap <Leader>a: :Tabularize /:<CR>
    vnoremap <Leader>a: :Tabularize /:<CR>
    nnoremap <Leader>a:: :Tabularize /:\zs<CR>
    vnoremap <Leader>a:: :Tabularize /:\zs<CR>
    nnoremap <Leader>a, :Tabularize /,<CR>
    vnoremap <Leader>a, :Tabularize /,<CR>
    nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>

  " display git and hg diff info on the side of a file
  Plug 'mhinz/vim-signify'
  let g:signify_vcs_list = [ 'hg', 'git' ]
  let g:signify_sign_change = '~'
  let g:signify_sign_delete = '-'
  let g:signify_sign_show_count = 0
  let g:signify_update_on_focusgained = 1

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

  " Snippets
  Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<c-b>"
  let g:UltiSnipsJumpForwardTrigger="<c-k>"
  let g:UltiSnipsJumpBackwardTrigger="<c-j>"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim-snippets/']

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
    Plug 'mtscout6/syntastic-local-eslint.vim'
    let g:syntastic_javascript_checkers = ['eslint', 'flow']
    let g:syntastic_javascript_flow_exe = 'flow status'

    " C++
    let g:syntastic_cpp_compiler = 'clang++'

    " Go
    let g:syntastic_go_checkers = ['go', 'golint']

    let g:syntastic_rust_checkers = ['rustc']

    " Elm
    let g:elm_syntastic_show_warnings = 1

  " Programming Languages

    " LaTeX
        "Plug 'lervag/vimtex', { 'for': 'tex' }
        "let g:vimtex_quickfix_open_on_warning = 0
        "let g:tex_flavor = 'latex'
        "let g:vimtex_view_general_viewer
        "      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        "let g:vimtex_view_general_options = '-r @line @pdf @tex'
        "let g:vimtex_compiler_latexmk = {
        "\ 'options' : [
        "\   '-pdf',
        "\   '-shell-escape',
        "\   '-verbose',
        "\   '-file-line-error',
        "\   '-synctex=1',
        "\   '-interaction=nonstopmode',
        "\ ],
        "\}

    " Javascript
        Plug 'elzr/vim-json', { 'for': 'json' }
        Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'xhtml', 'html'] }
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
        Plug 'rust-lang/rust.vim', { 'for': 'rust' }

    " Fish
        Plug 'dag/vim-fish', { 'for': 'fish' }

    " Elm
        Plug 'elmcast/elm-vim', { 'for': 'elm' }
        let g:elm_setup_keybindings = 0

    " Dart
        Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

    " F#
        Plug 'kongo2002/fsharp-vim', { 'for': 'fsharp' }

    " Go
       Plug 'fatih/vim-go', { 'for': 'go' }
       " disable fmt on save
       let g:go_fmt_autosave = 0
       let g:go_fmt_fail_silently = 1

  " Autocompletion
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer --ts-completer' }
    set completeopt-=preview
    nnoremap <leader>g :YcmCompleter GoTo<CR>
    let g:ycm_confirm_extra_conf = 0

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

  highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119
  highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=167
  highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=227

  " clear small side column for compat with colorscheme
  highlight clear SignColumn

  " Font to use
  set guifont=Monaco\ for\ Powerline:h12

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

  nnoremap H ^
  vnoremap H ^
  nnoremap L $
  vnoremap L $

  " easier to reach escape
  inoremap kj <esc>

  "arrow keys move between windows
  nnoremap   <Up>     <C-w><C-k>
  nnoremap   <Down>   <C-w><C-j>
  nnoremap   <Left>   <C-w><C-h>
  nnoremap   <Right>  <C-w><C-l>

  " create new tab easily
  nnoremap <Leader>t :tabnew<CR>

  " map leader + num to switch tabs
  nnoremap <silent> <Leader>1    1gt
  nnoremap <silent> <Leader>2    2gt
  nnoremap <silent> <Leader>3    3gt
  nnoremap <silent> <Leader>4    4gt
  nnoremap <silent> <Leader>5    5gt
  nnoremap <silent> <Leader>6    6gt
  nnoremap <silent> <Leader>7    7gt
  nnoremap <silent> <Leader>8    8gt
  nnoremap <silent> <Leader>9    :tablast<CR>

  " Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv

  " For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

  " Map space to select the current word
  nnoremap <space> viw

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

"""""""""""""""""""
"  Abbreviations  "
"""""""""""""""""""

  "iabbrev -pause await new Promise(() => {});

"""""""""""""""""""
"    Functions    "
"""""""""""""""""""

function! SFOpen()
  let l:url = join(["https://searchfox.org/mozilla-central/source/", expand('%'), "#", line('.')], "")
  call netrw#BrowseX(l:url, netrw#CheckIfRemote())
endfunction

command! SFOpen :call SFOpen()
nnoremap <Leader>sf :SFOpen<CR>
