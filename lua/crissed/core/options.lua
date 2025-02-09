-- Setting global variables
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.have_nerd_font = true

-- Setting vim options
local o = vim.opt
o.relativenumber = true
-- enable mouse
o.clipboard = "unnamedplus"
o.paste = false
-- Save undo history
o.undofile = true
o.updatetime = 250
o.timeoutlen = 300
o.cursorline = true
o.tabstop = 2
o.softtabstop = 0
o.shiftwidth = 2
o.expandtab = true
