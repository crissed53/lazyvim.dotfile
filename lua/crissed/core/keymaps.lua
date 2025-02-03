-- In your init.lua or a dedicated keymaps file (e.g., lua/user/core/keymaps.lua)

local k = vim.keymap

-- k.set({ "n", "v", "s", "c" }, "<C-s>", ":w<CR>", { silent = true, desc = "Save current buffer" })
k.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

