-- Any language related features, such as LSP, dap, lint, and formatting
-- Install dependencies with Mason
-- configure lint and formatting with none-ls
-- configure lsp with mason-lsp
-- configure DAP

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        volar = function(_, opts)
          opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
          opts.init_options = {
            vue = {
              hybridMode = false,
            },
          }
        end,
        tailwindcss = function(_, opts)
          opts.settings = {
            tailwindCSS = {
              validate = true,
              classAttributes = { "class", "className", "ngClass", "ui" },
              experimental = {
                classRegex = {
                  { "ui:\\s*{([^)]*)\\s*}", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "/\\*\\s?ui\\s?\\*/\\s*{([^;]*)}", ":\\s*[\"'`]([^\"'`]*).*?[\"'`]" },
                },
              },
            },
          }
        end,
        basedpyright = function(_, opts)
          opts.settings = {
            basedpyright = {
              typeCheckingMode = "basic",
            },
          }
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "vue-language-server",
        "basedpyright",
        "ruff",
        "black",
        "isort",
        -- "prettier",
        -- "black",
        -- "isort",
        -- "gopls",
        -- "prettierd",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        timeout_ms = 1000,
        async = false,
        quiet = false,
      },
      formatters_by_ft = {
        python = { "isort", "black" },
        vue = { "prettierd" },
        go = { "gopls" },
        typescript = { "prettierd" },
        html = { "prettierd" },
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
}
