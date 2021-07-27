" Moving
" move to beginning/end of line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

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

" Remap paste
vnoremap p "_dP
