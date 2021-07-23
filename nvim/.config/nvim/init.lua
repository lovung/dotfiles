if require('lovung.first_load')() then
  return
end

-- Add command for reloading main module. This is setup
-- manually at the beginning so that we can ensure that
-- it's always available even if some files fail to load.
vim.cmd [[command! Reload lua require('lovung.utils').Reload()]]

-- Load vim-plug plugins
if require('lovung.plugins')() then
  return
end

-- Neovim builtin LSP configuration
require('lovung.lsp')

-- Neovim builtin Compe configuration
require('lovung.compe')

