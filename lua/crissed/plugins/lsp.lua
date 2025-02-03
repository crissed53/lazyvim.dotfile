-- lua/user/plugins/lsp.lua
--[[
This file is dedicated to configuring the Language Server Protocol (LSP) setup in Neovim.
The LSP provides code intelligence features like autocompletion, go-to-definition,
find references, diagnostics (errors and warnings), and more.

Plugins typically found in this file:
- LSP Manager: mason.nvim, mason-lspconfig.nvim
- LSP Client: nvim-lspconfig
- Diagnostics UI: trouble.nvim, lsp_lines.nvim
- LSP Utilities: nlsp-settings.nvim (for managing LSP settings)
--]]

-- Example:
-- require('mason').setup { ... }
-- require('mason-lspconfig').setup { ... }
-- require('lspconfig').{server_name}.setup { ... }
return {}
