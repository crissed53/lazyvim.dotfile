-- Any language related features, such as LSP, dap, lint, and formatting
-- Install dependencies with Mason
-- configure lint and formatting with none-ls
-- configure lsp with mason-lsp
-- configure DAP

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "vue-language-server",
        "prettier",
        "black",
        "isort",
        "gopls",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format = {
        timeout_ms = 500,
        async = false,
        quiet = false,
      },
      formatters_by_ft = {
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
        -- python = { "isort", "black" },
        vue = { "prettier" },
        go = { "gopls" },
      },
      formatters = {
        isort = {
          prepend_args = { "--profile", "black" },
        },
        black = {
          prepend_args = { "--fast", "-l", "80" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },
}
