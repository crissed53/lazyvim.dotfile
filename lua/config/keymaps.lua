-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })

vim.keymap.set('n', 'y', require('osc52').copy_operator, { expr = true })
vim.keymap.set('n', 'yy', '<leader>c_', { remap = true })
vim.keymap.set('v', 'y', require('osc52').copy_visual)
