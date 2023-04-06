--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
-- lvim.format_on_save.enabled = true
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_presc,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "go",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
  swap = {
    enable = false,
    -- swap_next = textobj_swap_keymaps,
  },
}

-- Additional Plugins
lvim.plugins = {
  { "ellisonleao/gruvbox.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'mg979/vim-visual-multi' },
  { 'farmergreg/vim-lastplace' },
  { 'puremourning/vimspector' },
}

----------- My Configs ----------------
---------------------------------------
lvim.keys.normal_mode["<leader>sf"] = ":Telescope find_files theme=dropdown hidden=true previewer=true<cr>"
lvim.keys.insert_mode["jk"] = "<esc>"

vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = true -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8

-- Set whitespaces
vim.opt.listchars = 'eol:¬,tab:|·,trail:-,extends:>,precedes:<,nbsp:+'
vim.opt.list = true


-- Swap buffer
-- nmap <C-e> :e#<CR>
lvim.keys.normal_mode["<C-e>"] = ":e#<cr>"

-- Vmap for maintain Visual Mode after shifting > and <
-- vmap < <gv
-- vmap > >gv
lvim.keys.visual_mode[">"] = ">gv"
lvim.keys.visual_mode["<"] = "<gv"

--
-- Moving
-- move to beginning/end of line
lvim.keys.normal_mode["B"] = "^"
lvim.keys.normal_mode["E"] = "$"
lvim.keys.visual_mode["B"] = "^"
lvim.keys.visual_mode["E"] = "$"

-- Remap the hjkl
lvim.keys.normal_mode["H"] = "h"
lvim.keys.normal_mode["L"] = "l"
lvim.keys.normal_mode["l"] = "w"
lvim.keys.normal_mode["h"] = "b"

-- Save & quit in insert_mode
lvim.keys.insert_mode[":w<cr>"] = "<esc>:w<cr>"
lvim.keys.insert_mode[":q<cr>"] = "<esc>:q<cr>"

-- Moving in insert_mode
lvim.keys.insert_mode["<C-l>"] = "<Right>"
lvim.keys.insert_mode["<C-h>"] = "<Left>"

-- LSP
-- mappings
lvim.keys.normal_mode["<leader>lh"] = ":exe \"vertical resize +5\"<cr>"

-- Windows
-- Resize split window
lvim.keys.normal_mode["+"] = ":exe \"vertical resize +5\"<cr>"
lvim.keys.normal_mode["_"] = ":exe \"vertical resize -5\"<cr>"
lvim.keys.normal_mode["="] = ":exe \"resize +5\"<cr>"
lvim.keys.normal_mode["-"] = ":exe \"resize -5\"<cr>"

-- Remap paste in visual mode
-- in .vim it should be: vnoremap p "_dP
lvim.keys.visual_mode["p"] = "\"_dP"
lvim.keys.visual_block_mode["p"] = "\"_dP"

-- Windows
lvim.builtin.which_key.mappings.W = {
  name = "Windows",
  h = { ":<C-u>split<cr>", "Horizontal split" },
  v = { ":<C-u>vsplit<cr>", "Vertical split" },
}

-- vimspector config
-- nnoremap <F1> :call vimspector#Launch()<CR>
-- nnoremap <Leader>dl :call vimspector#Launch()<CR>
-- nnoremap <F5> :call vimspector#Continue()<CR>
-- nnoremap <Leader>dc :call vimspector#Continue()<CR>
-- nnoremap <F2> :call vimspector#Reset()<CR>
-- nnoremap <Leader>dq :call vimspector#Reset()<CR>
-- nnoremap <F3> :call vimspector#Stop()<CR>
-- nnoremap <Leader>ds :call vimspector#Stop()<CR>
-- nnoremap <F4> :call vimspector#Restart()<CR>
-- nnoremap <Leader>dr :call vimspector#Restart()<CR>
-- nnoremap <F6> :call vimspector#Pause()<CR>
-- nnoremap <F9> :call vimspector#ToggleBreakpoint()<CR>
-- nnoremap <Leader>dp :call vimspector#ToggleBreakpoint()<CR>
-- nnoremap <F10> :call vimspector#StepOver()<CR>
-- nnoremap <Leader>dn :call vimspector#StepOver()<CR>
-- nnoremap <F11> :call vimspector#StepInto()<CR>
-- nnoremap <Leader>di :call vimspector#StepInto()<CR>
-- nnoremap <F12> :call vimspector#StepOut()<CR>
-- nnoremap <Leader>do :call vimspector#StepOut()<CR>
-- lvim.builtin.which_key.mappings.W = {
--   name = "Windows",
--   h = { ":<C-u>split<cr>", "Horizontal split" },
--   v = { ":<C-u>vsplit<cr>", "Vertical split" },
-- }


-- NvimTree key mappings
-- Use `<leader>e`: Explorer instead
lvim.builtin.which_key.mappings.n = {
  name = "NvimTree",
  t = { ":NvimTreeToggle<cr>", "Tree toggle" },
  f = { ":NvimTreeFindFileToggle<cr>", "Find file" },
}

-- Telescope configurations
-- Enable preview in find files
lvim.builtin.telescope.pickers.find_files = {
  layout_strategy = "center",
  layout_config = { width = 0.80, height = 0.80, preview_width = nil, prompt_position = "bottom" },
  hidden = true,
}

-- lvim.builtin.telescope.pickers.live_grep = {
-- only_sort_text = true,
-- theme = "dropdown",
-- layout_config = { height = 0.90, width = 0.90, preview_cutoff = 30, preview_width = 0.5, prompt_position = "top" },
-- layout_strategy = "horizontal",
-- hidden = false,
-- }
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "vendor/*",
  "%.lock",
  "__pycache__/*",
  "%.sqlite3",
  "%.ipynb",
  "node_modules/*",
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  ".git/",
  "%.webp",
  ".dart_tool/",
  ".github/",
  ".gradle/",
  ".idea/",
  ".settings/",
  ".vscode/",
  "__pycache__/",
  "build/",
  "env/",
  "gradle/",
  "node_modules/",
  "target/",
  "%.pdb",
  "%.dll",
  "%.class",
  "%.exe",
  "%.cache",
  "%.ico",
  "%.pdf",
  "%.dylib",
  "%.jar",
  "%.docx",
  "%.met",
  "smalljre_*/*",
  ".vale/",
}

lvim.builtin.telescope.pickers.git_commits = {
  layout_strategy = "horizontal",
  layout_config = { height = 0.88, width = 0.88, preview_cutoff = 20, preview_width = 0.70, prompt_position = "bottom" }
}

-- Formatter & linter
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   {
--     command = "golangci-lint",
--     filetypes = { "go" },
--   },
-- }

-- Config DAP: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
local dap = require('dap')
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  }
}
