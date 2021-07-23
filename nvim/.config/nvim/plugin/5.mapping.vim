"*****************************************************************************
" Mappings
"*****************************************************************************

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:80%' --layout reverse --margin=1,4 --preview 'bat --theme=gruvbox --color=always --style=header,grid --line-range :300 {}'"

command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!{.git/node_modules}/*" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <leader>fv :RG<Cr>

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g "'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nmap <C-e> :e#<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>ee :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" " snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Close buffer
noremap <leader>c :bd<CR>

" Clean search (highlight)
nnoremap <silent> <ESC><ESC> :noh<cr>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" Vimspector configurations
nnoremap <F1> :call vimspector#Launch()<CR>
nnoremap <leader>dl :call vimspector#Launch()<CR>
nnoremap <F5> :call vimspector#Continue()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <F2> :call vimspector#Reset()<CR>
nnoremap <leader>dq :call vimspector#Reset()<CR>
nnoremap <F3> :call vimspector#Stop()<CR>
nnoremap <leader>ds :call vimspector#Stop()<CR>
nnoremap <F4> :call vimspector#Restart()<CR>
nnoremap <leader>dr :call vimspector#Restart()<CR>
nnoremap <F6> :call vimspector#Pause()<CR>
nnoremap <F9> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dp :call vimspector#ToggleBreakpoint()<CR>
nnoremap <F10> :call vimspector#StepOver()<CR>
nnoremap <leader>dn :call vimspector#StepOver()<CR>
nnoremap <F11> :call vimspector#StepInto()<CR>
nnoremap <leader>di :call vimspector#StepInto()<CR>
nnoremap <F12> :call vimspector#StepOut()<CR>
nnoremap <leader>do :call vimspector#StepOut()<CR>

"==============FloatTerm configurations========================
" FloatTerm
nnoremap   <silent> <Leader>tn    :FloatermNew<CR>
tnoremap   <silent> <Leader>tn    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent> <Leader>tq    :FloatermKill<CR>
tnoremap   <silent> <Leader>tq    <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent> <Leader>tt    :FloatermToggle<CR>
tnoremap   <silent> <Leader>tt    <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent> <Leader>ff    :FloatermNew fzf<CR>
tnoremap   <silent> <Leader>ff    <C-\><C-n>:FloatermNew fzf<CR>

