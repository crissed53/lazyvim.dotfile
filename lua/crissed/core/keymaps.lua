-- In your init.lua or a dedicated keymaps file (e.g., lua/user/core/keymaps.lua)

local k = vim.keymap

k.set({ "n", "i", "v", "s", "x" }, "<C-s>", "<Cmd>w<Cr>", { desc = "Save file", silent = true, noremap = true })

k.set("n", "<leader>qq", "<Cmd>qa<Cr>", { desc = "quit all" })

k.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window", remap = true })
k.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window", remap = true })
k.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to bottom window", remap = true })
k.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to top window", remap = true })
