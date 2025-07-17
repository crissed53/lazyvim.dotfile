-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local Util = require("lazyvim.util")
-- vim.keymap.set("n", "<C-_>", function()
--   Util.terminal(nil, { border = "rounded" })
-- end, { desc = "Term with border" })
-- -- Safely enhances <Esc> to dismiss notifications first
-- Create the keymap using the smart function
-- In lua/config/keymaps.lua
local map = vim.keymap.set

-- -- Map C-[ to Esc in insert mode
-- map("i", "<C-[>", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
--
-- -- Map C-[ to Esc in command-line mode
-- map("c", "<C-[>", "<Esc>", { noremap = true, silent = true, desc = "Exit command-line mode" })
--
-- -- Map C-[ to Esc in visual mode
-- map("v", "<C-[>", "<Esc>", { noremap = true, silent = true, desc = "Exit visual mode" })

-- Map C-[ to Esc in terminal mode
map("t", "<C-[>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
