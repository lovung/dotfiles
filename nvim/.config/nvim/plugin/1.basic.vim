"*****************************************************************************
"* Basic Setup
"*****************************************************************************"
" Theme
set background=dark
color gruvbox
colorscheme gruvbox
let ayucolor="mirage"

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to ,
let mapleader=','

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Other
set showcmd
set signcolumn=yes
" You will have bad experience for diagnosticmessages when it's default 4000.
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
set wildmenu
set wildmode=longest:full,full
set showmatch
set lazyredraw
set wildoptions=pum
set pumblend=50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set lcs=tab:\|\  "
set cursorline
hi Cursor guifg=green guibg=green
hi Cursor2 guifg=red guibg=red
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50

" code folding
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
nmap <leader>fc :foldclose<CR> 
nmap <leader>fo :foldopen<CR>
nmap <leader>fa :set foldlevel=99<CR>
nmap <leader>fl :set foldlevel=0<CR>
 
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e
