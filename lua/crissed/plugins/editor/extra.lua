-- lua/user/plugins/editor.lua
--[[
This file contains configurations for plugins that enhance the core editing experience in Neovim.
These plugins provide features like improved syntax highlighting, automatic code commenting,
surrounding text with delimiters, and automatic pairing of brackets.

Plugins typically found in this file:
- Syntax Highlighting: nvim-treesitter and its modules
- Commenting: Comment.nvim, nvim-ts-context-commentstring
- Surrounding: vim-surround, mini.surround
- Auto-Pairs: nvim-autopairs, mini.pairs
- Bracket Highlighting/Jumping: rainbow-delimiters.nvim
--]]

-- Example:
-- require('nvim-treesitter.configs').setup { ... }
-- require('Comment').setup { ... }
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{ "echasnovski/mini.ai", opts = {} },
	{ "echasnovski/mini.surround", opts = {} },
	{
		"echasnovski/mini.basics",
		opts = {
			mappings = {
				windows = true,
			},
		},
	},
}
