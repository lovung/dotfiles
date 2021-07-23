vim.fn['plug#begin']('~/.config/nvim/plugged')

vim.cmd [[Plug 'scrooloose/nerdtree']]
vim.cmd [[Plug 'vim-airline/vim-airline']]
vim.cmd [[Plug 'vim-airline/vim-airline-themes']]
vim.cmd [[Plug 'airblade/vim-gitgutter']]
vim.cmd [[Plug 'vim-scripts/grep.vim']]
vim.cmd [[Plug 'vim-scripts/CSApprox']]
vim.cmd [[Plug 'Raimondi/delimitMate']]
vim.cmd [[Plug 'majutsushi/tagbar']]
vim.cmd [[Plug 'dense-analysis/ale']]
vim.cmd [[Plug 'Yggdroot/indentLine']]
vim.cmd [[Plug 'editor-bootstrap/vim-bootstrap-updater']]
vim.cmd [[Plug 'sheerun/vim-polyglot']]
vim.cmd [[Plug 'Mizux/vim-colorschemes']]
vim.cmd [[Plug 'yuttie/comfortable-motion.vim']]
vim.cmd [[Plug 'mg979/vim-visual-multi', {'branch': 'master'}]]

vim.cmd [[Plug 'tpope/vim-commentary']]
vim.cmd [[Plug 'tpope/vim-fugitive']]
vim.cmd [[Plug 'tpope/vim-rhubarb']]

vim.cmd [[Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }]]
vim.cmd [[Plug 'junegunn/fzf.vim']]

-- Snippets
vim.cmd [[Plug 'honza/vim-snippets']]
vim.cmd [[Plug 'hrsh7th/vim-vsnip']]
vim.cmd [[Plug 'hrsh7th/vim-vsnip-integ']]

-- Color
vim.cmd [[Plug 'tomasr/molokai']]
vim.cmd [[Plug 'dracula/vim', { 'as': 'dracula' }]]
vim.cmd [[Plug 'ayu-theme/ayu-vim']]
vim.cmd [[Plug 'morhetz/gruvbox']]
vim.cmd [[Plug 'liuchengxu/space-vim-dark']]

vim.cmd [[Plug 'voldikss/vim-floaterm']]

-- LSP
vim.cmd [[Plug 'puremourning/vimspector']]
vim.cmd [[Plug 'neovim/nvim-lspconfig']]
vim.cmd [[Plug 'kabouzeid/nvim-lspinstall']]
vim.cmd [[Plug 'ray-x/lsp_signature.nvim']]
vim.cmd [[Plug 'kevinhwang91/nvim-bqf']]
vim.cmd [[Plug 'hrsh7th/nvim-compe']]

--   Lua LSP
vim.cmd [[Plug 'euclidianAce/BetterLua.vim']] -- better syntax highlighting

vim.cmd [[Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}]]
vim.cmd [[Plug 'sebdah/vim-delve']]

-- Treesitter
vim.cmd [[Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}]]
vim.cmd [[Plug 'wakatime/vim-wakatime']]

vim.fn['plug#end']()
