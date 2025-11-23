return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local Util = require("lazyvim.util")

    local function buf_relative_to_root()
      local buf = vim.api.nvim_buf_get_name(0)
      if buf == "" then
        return "[No Name]"
      end
      local root = Util.root.get({ buf = 0 }) or vim.loop.cwd()
      if buf:sub(1, #root) == root then
        local rel = buf:sub(#root + 2) -- trim “/” plus root
        return rel ~= "" and rel or vim.fn.fnamemodify(buf, ":t")
      end
      return vim.fn.fnamemodify(buf, ":.")
    end

    opts.sections.lualine_c = {
      { buf_relative_to_root },
    }
  end,
}
