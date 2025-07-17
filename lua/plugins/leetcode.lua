-- Helper function to check the buffer path
local function is_leetcode_buffer(bufnr)
  local buf_name = vim.api.nvim_buf_get_name(bufnr or 0)
  return buf_name and string.find(buf_name, "/leetcode/", 1, true)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("DisableLspForLeetCode", { clear = true }),
  callback = function(args)
    -- We need the buffer number from the arguments
    local bufnr = args.buf

    -- Check if the path contains the leetcode directory
    if is_leetcode_buffer(bufnr) then
      -- CRITICAL: Defer the detach operation.
      -- This waits until the initial LSP setup is complete, avoiding errors.
      vim.schedule(function()
        vim.lsp.buf_detach_client(bufnr, args.data.client_id)
      end)
      vim.diagnostic.enable(false)
      vim.b.completion = false
    end
  end,
})

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
