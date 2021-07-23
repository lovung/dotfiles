# Dotfiles

## Install 
```
brew install stow
```

## Sync with ~/.config folder
```
stow nvim
```


## Remap
```
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

" Remap paste
vnoremap p "_dP
```

## Hotkeys

### Normal mode

#### Directly

- `gd`: LSP go to definition
- `gD`: LSP go to declaration
- `gi`: LSP go to implementation
- `gr`: LSP go to references
- `[d`: LSP go to prev diagnostics
- `]d`: LSP go to next diagnostics

- `tt`: NERDTree Toggle
- `nf`: NERDTree Find


#### After <Leader>
- `lD`: LSP go to type definition
- `lh`: LSP hover
- `le`: LSP help
- `lr`: LSP rename
- `lc`: LSP code action
- `ld`: LSP show diagnostics
- `lf`: LSP formatting 

### Insert / S mode


### Visual mode
