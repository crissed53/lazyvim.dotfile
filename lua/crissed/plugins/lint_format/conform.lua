-- lua/plugins/conform.lua

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "ruff_format" },
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		-- Configure Ruff formatter for Black and isort compatibility
		require("conform").formatters.ruff_format = {
			prepend_args = function()
				return {
					"--fix",
					"--line-length",
					"80",
					"--exit-non-zero-on-fix",
					"--select",
					"E,F,I",
					"--ignore",
					"D",
				}
			end,
		} -- Ensure there is a comma here, it was missing in the previous code
	end,
}
