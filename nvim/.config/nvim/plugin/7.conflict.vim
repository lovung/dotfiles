"""""""""""""""""""""""""""""""""""""""
" Find Nearest
" Source: http://vim.1045645.n5.nabble.com/find-closest-occurrence-in-both-directions-td1183340.html
"""""""""""""""""""""""""""""""""""""""                           
function! FindNearest(pattern)
  let @/=a:pattern
  let b:prev = search(a:pattern, 'bncW')
  if b:prev
    let b:next = search(a:pattern, 'ncW')
    if b:next
      let b:cur = line('.')
      if b:cur - b:prev == b:next - b:cur
        " on a match
      elseif b:cur - b:prev < b:next - b:cur
        ?
      else
        /
      endif
    else
      ?
    endif
  else
    /
  endif
endfunction

function! FindAbove(pattern)
  let @/=a:pattern
  let b:prev = search(a:pattern, 'bncW')
  if b:prev
    ?
  else
    /
  endif
endfunction

command! -nargs=1 FA call FindAbove(<q-args>)
nmap \ :FA<space>

"" Select between conflict blocks
" select ours
nmap <leader>so \<<<<<<<<CR>dd/=======<CR>V/>>>>>>><CR>d<ESC
" select theirs
nmap <leader>st \<<<<<<<<CR>V/=======<CR>d/>>>>>>><CR>dd<ESC>
" select both
nmap <leader>sb /<<<<<<<<CR>dd/=======<CR>dd/>>>>>>><CR>dd<ESC>
" find next conflict
nmap <leader>nc /<<<<<<<<CR>

