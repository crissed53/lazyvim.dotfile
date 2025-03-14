return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      winopts = {
        width = 0.95,
        col = 0.55,
        preview = {
          horizontal = "right:55%",
        },
      },
    },
    keys = {
      {
        ";f",
        function()
          require("fzf-lua").files() -- {resume = true} for resume feature
        end,
        desc = "live grep (fzf)",
      },
      {
        ";g",
        function()
          require("fzf-lua").live_grep() -- {resume = true} for resume feature
        end,
        desc = "live grep (fzf)",
      },
      {
        ";b",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "list buffers (fzf)",
      },
      {
        ";q",
        function()
          require("fzf-lua").quickfix()
        end,
        desc = "list quickfixes (fzf)",
      },
      {
        ";h",
        function()
          require("fzf-lua").oldfiles()
        end,
        desc = "list history files (fzf)",
      },
      {
        ";t",
        function()
          require("fzf-lua").tabs()
        end,
        desc = "list tabs (fzf)",
      },
      {
        ";c",
        function()
          require("fzf-lua").awesome_colorschemes()
        end,
        desc = "list colorschemes (fzf)",
      },
      {
        ";;",
        function()
          require("fzf-lua").resume()
        end,
        desc = "resume (fzf)",
      },
      {
        ";x",
        function()
          require("fzf-lua").diagnostics_document()
        end,
        desc = "diagnostics_document (fzf)",
      },
      {
        ";X",
        function()
          require("fzf-lua").diagnostics_workspace()
        end,
        desc = "diagnostics_workspace (fzf)",
      },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
  },
}
