return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  -- {
  --   "ibhagwan/smartyank.nvim",
  --   event = "VeryLazy",
  -- },
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    keys = {
      { "y",  mode = { "n", "v" } },
      { "yy", mode = { "n", "v" } },
      { "p",  mode = { "n", "v" } },
      { "P",  mode = { "n", "v" } },
    },
    opts = {
      silent = true,
    }
  }
}
