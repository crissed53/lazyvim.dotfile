return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  lazy = false,
  dependencies = {
    -- "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "python3",
    description = {
      width = "50%",
    },
    injector = {
      ["python3"] = {
        before = {
          "from typing import *",
        },
      },
    },
  },
  keys = {
    {
      ";lm",
      "<Cmd>Leet<CR>",
      desc = "leetcode menu",
    },
    {
      ";li",
      "<Cmd>Leet info<CR>",
      desc = "leetcode info",
    },
    {
      ";ll",
      "<Cmd>Leet list<CR>",
      desc = "leetcode list",
    },
    {
      ";ll",
      "<Cmd>Leet list<CR>",
      desc = "leetcode list",
    },
    {
      ";lc",
      "<Cmd>Leet console<CR>",
      desc = "leetcode console",
    },
    {
      ";lt",
      "<Cmd>Leet tabs<CR>",
      desc = "leetcode tabs",
    },
    {
      ";ly",
      "<Cmd>Leet yank<CR>",
      desc = "leetcode yank",
    },
    {
      ";ls",
      "<Cmd>Leet submit<CR>",
      desc = "leetcode submit",
    },
    {
      ";lR",
      "<Cmd>Leet reset<CR>",
      desc = "leetcode reset",
    },
    {
      ";lr",
      "<Cmd>Leet run<CR>",
      desc = "leetcode run",
    },
    {
      ";lo",
      "<Cmd>Leet open<CR>",
      desc = "leetcode open in browser",
    },
    {
      ";lC",
      "<Cmd>Leet cookie<CR>",
      desc = "leetcode cookie",
    },
    {
      "\\\\",
      "<Cmd>Leet tabs<CR>",
      desc = "leetcode tabs",
    },
  },
}
