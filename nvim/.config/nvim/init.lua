if require('lovung.first_load')() then
  return
end

-- Load vim-plug plugins
require('lovung.plugins')

-- Neovim builtin LSP configuration
require('lovung.lsp')