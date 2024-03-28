-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
---@class LazyFloatOptions
---@field buf? number
---@field file? string
---@field margin? {top?:number, right?:number, bottom?:number, left?:number}
---@field size? {width:number, height:number}
---@field zindex? number
---@field style? "" | "minimal"
---@field border? "none" | "single" | "double" | "rounded" | "solid" | "shadow"
---@field title? string
---@field title_pos? "center" | "left" | "right"
---@field persistent? boolean
---@field ft? string
---@field noautocmd? boolean
---@field backdrop? float
vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })
