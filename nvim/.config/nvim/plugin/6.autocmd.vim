"*****************************************************************************
" Autocmd Rules
"*****************************************************************************
" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\") > 1 && line("'\") <= line("$") | exe "normal! g`\" | endif
augroup END

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
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
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 300)

augroup go
  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <leader>gr  <Plug>(go-run)
  au FileType go nmap <leader>gt  <Plug>(go-test)
  au FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>gi <Plug>(go-info)
  " au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
augroup END

" Auto build and run unit test
" augroup auto_go
" 	autocmd!
" 	autocmd BufWritePost *.go :GoBuild
" 	autocmd BufWritePost *_test.go :GoTest
" augroup end

" Auto build and run unit test
augroup auto_json
	autocmd!
	autocmd BufWritePost *.json :%!python -m json.tool 
augroup end

au BufRead,BufNewFile *.go set filetype=go

