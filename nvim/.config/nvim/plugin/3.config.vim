"*****************************************************************************
" Custom configs
"*****************************************************************************

set mmp=5000

"*****************************************************************************
"*****************************************************************************

" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif



"====================== FZF Configuration===============
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:80%' --layout reverse --margin=1,4 --preview 'bat --theme=gruvbox-dark --color=always --style=header,grid --line-range :300 {}'"

command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --hidden --line-number --no-heading --color=always --smart-case -g "!{.git,node_modules}/*" -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

