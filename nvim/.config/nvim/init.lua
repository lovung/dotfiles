if require('lovung.first_load')() then
  return
end

-- Add command for reloading main module. This is setup
-- manually at the beginning so that we can ensure that
-- it's always available even if some files fail to load.
vim.cmd [[command! Reload lua require('lovung.utils').Reload()]]

-- Load vim-plug plugins
require('lovung.plugins')

-- Neovim builtin LSP configuration
require('lovung.lsp')

-- Neovim builtin TreeSitter configuration
require('lovung.treesitter')

-- Neovim builtin Compe configuration
-- require('lovung.compe')

-- A completion plugin for neovim coded in Lua.
-- https://github.com/hrsh7th/nvim-cmp/
require('lovung.cmp')

-- Neovim builtin LSP Signature configuration
require('lovung.signature')
