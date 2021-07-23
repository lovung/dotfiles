"*****************************************************************************
" Custom configs
"*****************************************************************************
" Moving
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Remap the hjkl
nnoremap L l
nnoremap H h
nnoremap l w
nnoremap h b

" jk is escape
inoremap jk <esc>
inoremap :w<CR> <ESC>:w<CR>
inoremap :q<CR> <ESC>:q<CR>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" Save
nnoremap <D-s> :w<CR>

" Windows
" Resize split window
nnoremap <silent> + :exe "vertical resize +5"<CR>
nnoremap <silent> _ :exe "vertical resize -5"<CR>
nnoremap <silent> = :exe "resize +5"<CR>
nnoremap <silent> - :exe "resize -5"<CR>

" Remap paste
vnoremap p "_dP

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
" function! s:build_go_files()
"   let l:file = expand('%')
"   if l:file =~# '^\f\+_test\.go$'
"     call go#test#Test(0, 1)
"   elseif l:file =~# '^\f\+\.go$'
"     call go#cmd#Build(0)
"   endif
" endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_operators = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

" ale
let g:ale_linters = {}
:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })

"*****************************************************************************
"*****************************************************************************

" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif
