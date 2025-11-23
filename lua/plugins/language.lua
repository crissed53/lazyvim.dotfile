-- Any language related features, such as LSP, dap, lint, and formatting
-- Install dependencies with Mason
-- configure lint and formatting with none-ls
-- configure lsp with mason-lsp
-- configure DAP

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- 1. Add 'servers' block to explicitly enable 'ty' and disable 'basedpyright'
      servers = {
        basedpyright = { enabled = false }, -- Disable basedpyright
        ty = {
          -- ty is supported in newer nvim-lspconfig versions.
          -- If your nvim-lspconfig is old, you might need to add manual setup cmd:
          -- cmd = { "ty", "lsp" },
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
