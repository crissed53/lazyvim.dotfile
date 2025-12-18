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
-- setup = {
--   -- volar = function(_, opts)
--   --   opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
--   --   opts.init_options = {
--   --     vue = {
--   --       hybridMode = false,
--   --     },
--   --   }
--   -- end,
--   -- tailwindcss = function(_, opts)
--   --   opts.settings = {
--   --     tailwindCSS = {
--   --       validate = true,
--   --       classAttributes = { "class", "className", "ngClass", "ui" },
--   --       experimental = {
--   --         classRegex = {
--   --           { "ui:\\s*{([^)]*)\\s*}", "[\"'`]([^\"'`]*).*?[\"'`]" },
--   --           { "/\\*\\s?ui\\s?\\*/\\s*{([^;]*)}", ":\\s*[\"'`]([^\"'`]*).*?[\"'`]" },
--   --         },
--   --       },
--   --     },
--   --   }
--   -- end,
--   -- basedpyright setup handler removed since we disabled it above
-- },

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                indexing = false,
                useLibraryCodeForTypes = false,
                typeCheckingMode = "basic", -- or "basic"
              },
            },
          },
        },
        ty = {
          settings = {
            ty = {
              experimental = { autoImport = true, rename = true },
            },
          },
        },
      },
      setup = {
        basedpyright = function(_, opts)
          local user_on_attach = opts.on_attach
          opts.on_attach = function(client, bufnr)
            -- keep diagnostics/code actions, drop other providers
            client.server_capabilities.documentHighlightProvider = false
            client.server_capabilities.referencesProvider = false
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.completionProvider = nil
            client.server_capabilities.signatureHelpProvider = nil
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.renameProvider = false
            client.server_capabilities.inlayHintProvider = false
            client.server_capabilities.definitionProvider = false
            client.server_capabilities.declarationProvider = false
            client.server_capabilities.typeDefinitionProvider = false
            client.server_capabilities.documentSymbolProvider = false
            client.server_capabilities.workspaceSymbolProvider = false
            if user_on_attach then
              user_on_attach(client, bufnr)
            end
          end
        end,
        ty = function(_, opts)
          opts.handlers = opts.handlers or {}
          -- drop Ty diagnostics so BasedPyright is the sole type checker
          opts.handlers["textDocument/publishDiagnostics"] = function() end

          -- local user_on_attach = opts.on_attach
          -- opts.on_attach = function(client, bufnr)
          --   -- keep diagnostics/code actions, drop other providers
          --   client.server_capabilities.hoverProvider = false
          --   client.server_capabilities.completionProvider = nil
          --   client.server_capabilities.signatureHelpProvider = nil
          --   client.server_capabilities.documentFormattingProvider = false
          --   client.server_capabilities.renameProvider = false
          --   if user_on_attach then
          --     user_on_attach(client, bufnr)
          --   end
          -- end
        end,
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
        vue = { "prettier" },
        go = { "gopls" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        html = { "prettier" },
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
