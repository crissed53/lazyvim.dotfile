return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons", "rktjmp/lush.nvim" },
	keys = {
		{
			";f",
			function()
				require("fzf-lua").files()
			end,
			desc = "Open files (fzf-lua)",
		},
		{
			";g",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live grep (fzf-lua)",
		},
		{
			";b",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Show buffers (fzf-lua)",
		},
		{
			";c",
			function()
				require("fzf-lua").awesome_colorschemes()
			end,
			desc = "Show colorschemes (fzf-lua)",
		},
		opts = {},
	},
}
