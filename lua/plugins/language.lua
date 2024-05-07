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
      },
    },
  },
  {
    -- docstring generator
    "kkoomen/vim-doge",
    lazy = false,
    build = ":call doge#install()",
    config = function()
      -- Generate comment for current line
      vim.keymap.set("n", "<Leader>d", "<Plug>(doge-generate)")

      -- Interactive mode comment todo-jumping
      vim.keymap.set("n", "<TAB>", "<Plug>(doge-comment-jump-forward)")
      vim.keymap.set("n", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
      vim.keymap.set("i", "<TAB>", "<Plug>(doge-comment-jump-forward)")
      vim.keymap.set("i", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
      vim.keymap.set("x", "<TAB>", "<Plug>(doge-comment-jump-forward)")
      vim.keymap.set("x", "<S-TAB>", "<Plug>(doge-comment-jump-backward)")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
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
        python = { "isort", "black" },
        vue = { "prettierd" },
        go = { "gopls" },
        typescript = { "prettierd" },
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
