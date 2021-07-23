"*****************************************************************************
" Autocmd Rules
"*****************************************************************************
" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc_sync_fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vim_remember_cursor
    autocmd!
    autocmd BufReadPost * lua require('lovung/utils').RestoreCursorPos()
augroup END

" txt
augroup vimrc_wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc_make_cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" proto
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

set autoread

" Auto-format *.go (golang) files prior to saving them

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 300)

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>cr  <Plug>(go-run)
  au FileType go nmap <Leader>ct  <Plug>(go-test)
  au FileType go nmap <Leader>cc <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>ci <Plug>(go-info)
  " au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
augroup END

" Auto build and run unit test
augroup auto_json
	autocmd!
	autocmd BufWritePost *.json :%!python -m json.tool 
augroup end

au BufRead,BufNewFile *.go set filetype=go

