return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["<BS>"] = { "actions.parent", mode = "n" },
		},
		float = {
			max_width = 0.5,
			max_height = 0.7,
			win_options = {
				winblend = 0,
			},
		},
	},
	keys = {
		{
			"<space>e",
			function()
				require("oil").open_float()
			end,
			desc = "Open [E]xplorer (Oil)",
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
