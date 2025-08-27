-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Normal Mode
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<C-e>", "<cmd>e#<cr>", { desc = "Swap buffer" })
map("n", "B", "^", { desc = "Beginning of line" })
map("n", "E", "$", { desc = "End of line" })
map("n", "H", "h", { desc = "Left" })
map("n", "L", "l", { desc = "Right" })
map("n", "l", "w", { desc = "Word forward" })
map("n", "h", "b", { desc = "Word backward" })
map("n", "<leader>lh", ":vertical resize +5<cr>", { desc = "Resize +5" })
map("n", "+", ":vertical resize +5<cr>", { desc = "Increase width" })
map("n", "_", ":vertical resize -5<cr>", { desc = "Decrease width" })
map("n", "=", ":resize +5<cr>", { desc = "Increase height" })
map("n", "-", ":resize -5<cr>", { desc = "Decrease height" })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "LSP Go to Implementation" })

-- Visual Mode
map("v", "<", "<gv", { desc = "Indent left and stay" })
map("v", ">", ">gv", { desc = "Indent right and stay" })
map("v", "B", "^", { desc = "Beginning of line" })
map("v", "E", "$", { desc = "End of line" })
map("v", "p", '"_dP', { desc = "Paste without overwrite" })

-- Visual Block Mode
map("x", "p", '"_dP', { desc = "Paste without overwrite" })

-- Insert Mode
map("i", "jk", "<esc>", { desc = "Escape insert mode" })
map("i", ":w<cr>", "<esc>:w<cr>", { desc = "Save from insert" })
map("i", ":q<cr>", "<esc>:q<cr>", { desc = "Quit from insert" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })

-- Windows (use built-in splits or enhance with which-key)
map("n", "<leader>Wh", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>Wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- NvimTree mappings (should work if nvim-tree is installed)
map("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>", { desc = "Tree Toggle" })
map("n", "<leader>nf", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Find File in Tree" })
