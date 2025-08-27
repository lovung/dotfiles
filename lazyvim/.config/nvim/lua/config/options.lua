-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.backup = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 2
opt.colorcolumn = "99999"
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.foldmethod = "manual"
opt.foldexpr = ""
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = true
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 100
opt.title = true
opt.titlestring = "%<%F%=%l/%L - nvim"
opt.undodir = vim.fn.stdpath("cache") .. "/undo"
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = false
opt.spell = false
opt.spelllang = "en"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.listchars = "eol:¬,tab:|·,trail:-,extends:>,precedes:<,nbsp:+"
opt.list = true

vim.g.lazyvim_check_order = false
