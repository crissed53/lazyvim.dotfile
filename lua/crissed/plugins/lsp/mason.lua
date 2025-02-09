-- ~/.config/nvim/lua/plugins/mason.lua
return {
	-- Mason (LSP, DAP, Linter, Formatter Manager)
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP Config (Bridge for Mason + LSP Config)
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	},

	-- Mason Tool Installer (For linters, formatters, and additional tools)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua_ls",
					"stylua",
					"prettierd",
					"ruff",
					"basedpyright",
					"rust_analyzer",
				},
			})
		end,
	},

	-- LSP Config (Core LSP Support)
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						-- capabilities = capabilities,
					})
				end,
			})
		end,
	},
}
