local max_width = math.max(50, math.floor(0.4 * vim.api.nvim_win_get_width(0)))

return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      ";o",
      function()
        require("oil").open_float()
      end,
      desc = "File Explorer",
    },
    {
      "<leader>fo",
      function()
        require("oil").open_float()
      end,
      desc = "File Explorer",
    },
  },
  opts = {
    default_file_explorer = true,
    win_options = {
      number = false,
      relativenumber = false,
      scrolloff = 2,
      sidescrolloff = 2,
    },
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
    float = {
      padding = 2,
      max_width = max_width,
      max_height = 0.8,
      border = "rounded",
      win_options = {
        number = false,
        relativenumber = false,
        scrolloff = 2,
        sidescrolloff = 2,
      },
    },
    keymaps_help = {
      border = "rounded",
    },
    confirmation = {
      border = "rounded",
    },
    progress = {
      border = "rounded",
    },
    ssh = {
      border = "rounded",
    },
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["q"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["<BS>"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
  },
}
