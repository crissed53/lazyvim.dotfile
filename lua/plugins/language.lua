-- Any language related features, such as LSP, dap, lint, and formatting
-- Install dependencies with Mason
-- configure lint and formatting with none-ls
-- configure lsp with mason-lsp
-- configure DAP
-- vim.lsp.config("ty", {
--   settings = {
--     ty = {
--       experimental = {
--         autoImport = true,
--       },
--     },
--   },
-- })

-- require("lspconfig").basedpyright.setup({
--   settings = {
--     basedpyright = {
--       analysis = {
--         indexing = false,
--         useLibraryCodeForTypes = false,
--         typeCheckingMode = "basic",
--         exclude = {
--           "**/.venv", "**/env", "**/node_modules",
--           "**/dist", "**/build", "**/.mypy_cache",
--           "**/.pytest_cache", "**/.git",
--         },
--       },
--     },
--   },
-- })

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {},
        ty = {
          settings = {
            ty = {
              experimental = {
                autoImport = true,
                rename = true,
              },
            },
          },
        },
      },
      setup = {
        -- volar = function(_, opts)
        --   opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
        --   opts.init_options = {
        --     vue = {
        --       hybridMode = false,
        --     },
        --   }
        -- end,
        -- tailwindcss = function(_, opts)
        --   opts.settings = {
        --     tailwindCSS = {
        --       validate = true,
        --       classAttributes = { "class", "className", "ngClass", "ui" },
        --       experimental = {
        --         classRegex = {
        --           { "ui:\\s*{([^)]*)\\s*}", "[\"'`]([^\"'`]*).*?[\"'`]" },
        --           { "/\\*\\s?ui\\s?\\*/\\s*{([^;]*)}", ":\\s*[\"'`]([^\"'`]*).*?[\"'`]" },
        --         },
        --       },
        --     },
        --   }
        -- end,
        -- basedpyright setup handler removed since we disabled it above
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- "vue-language-server",
        -- "basedpyright", -- Removed: We are using 'ty' instead
        -- "ruff", -- Keep ruff for linting/formatting
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
        python = { "ruff_organize_imports", "ruff_format" },
        vue = { "prettierd" },
        go = { "gopls" },
        typescript = { "prettierd" },
        html = { "prettierd" },
      },
      formatters = {
        ruff_format = {
          command = "ruff",
          args = { "format", "--force-exclude", "$FILENAME" },
          stdin = false,
        },
        ruff_organize_imports = {
          command = "ruff",
          args = { "check", "--select", "I", "--fix", "--force-exclude", "$FILENAME" },
          stdin = false,
          exit_codes = { 0, 1 },
        },
      },
    },
  },
}
