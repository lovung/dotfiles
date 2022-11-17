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

-- Additional Plugins
lvim.plugins = {
  { "ellisonleao/gruvbox.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

----------- My Configs ----------------
---------------------------------------
lvim.keys.normal_mode["<leader>sf"] = ":Telescope find_files theme=dropdown hidden=true previewer=true<cr>"
lvim.keys.insert_mode["jk"] = "<esc>"

vim.opt.relativenumber = true

-- Swap buffer
-- nmap <C-e> :e#<CR>
lvim.keys.normal_mode["<C-e>"] = ":e#<cr>"

-- Vmap for maintain Visual Mode after shifting > and <
-- vmap < <gv
-- vmap > >gv
lvim.keys.visual_mode[">"] = ">gv"
lvim.keys.visual_mode["<"] = "<gv"



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

lvim.builtin.telescope.pickers.live_grep = {
  only_sort_text = true,
  theme = "dropdown",
  layout_config = { height = 0.99, width = 0.99, preview_cutoff = 120, preview_width = 0.6, prompt_position = "top" },
  layout_strategy = "horizontal",
  hidden = true
}

lvim.builtin.telescope.pickers.git_commits = {
  layout_strategy = "horizontal",
  layout_config = { height = 0.88, width = 0.88, preview_cutoff = 20, preview_width = 0.70, prompt_position = "bottom" }
}

-- Formatter & linter
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "golangci-lint",
    filetypes = { "go" },
  },
}
