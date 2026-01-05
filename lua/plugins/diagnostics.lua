return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local border = "rounded"

      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.float = vim.tbl_deep_extend("force", {
        border = border,
        focusable = true,
        source = "if_many",
        style = "minimal",
      }, opts.diagnostics.float or {})

      opts.servers = opts.servers or {}
      opts.servers["*"] = opts.servers["*"] or {}
      opts.servers["*"].handlers = vim.tbl_deep_extend("force", opts.servers["*"].handlers or {}, {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
      })

      -- Also set global fallback handlers (covers any client that doesn't inherit handlers above)
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = border }
      )

      -- Default border for any floating preview that doesn't set one (captures many plugin floats)
      local orig = vim.lsp.util.open_floating_preview
      vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig(contents, syntax, opts, ...)
      end
    end,
  },
}
