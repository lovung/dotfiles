"*****************************************************************************
" Visual Settings
"*****************************************************************************
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set ruler
set number
set relativenumber

let no_buffers_menu=1
" silent! colorscheme space-vim-dark
hi Comment cterm=italic

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'term'
      set term=xterm-256color
    endif
  endif
  
endif

if &term =~ '256color'
  set t_ut=
endif


" Disable the blinking cursor.
set gcr=a:blinkon0

set scrolloff=3


" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Set whitespaces
set listchars=eol:¬,tab:\|\·,trail:-,extends:>,precedes:<,nbsp:+
set list
"tab:>·,trail:~,extends:>,precedes:<,space:␣
noremap <leader>hs :set list!<CR>
inoremap <leader>hs <C-o>:set list!<CR>
cnoremap <leader>hs <C-c>:set list!<CR>


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

