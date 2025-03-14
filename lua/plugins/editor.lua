return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        ";e",
        function()
          Snacks.explorer()
        end,
        desc = "open explorer (snacks)",
      },
    },
    opts = {
      terminal = {
        win = {
          position = "float",
          border = "rounded",
        },
      },
      explorer = {},
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            layout = {
              -- preset = "sidebar",
              -- preview = false,
              layout = {
                backdrop = false,
                box = "horizontal",
                width = 0.3,
                min_width = 50,
                height = 0.8,
                {
                  box = "vertical",
                  border = "rounded",
                  title = "{title} {live} {flags}",
                  { win = "input", height = 1, border = "bottom" },
                  { win = "list", border = "none" },
                },
                { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
              },
            },
          },
        },
      },
    },
  },
}
