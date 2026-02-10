
local function nt_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-n>', api.tree.toggle)
end


return {
  "nvim-tree/nvim-tree.lua" ,             -- LSP Support (Intellisense)
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
  },
  lazy = false,
  keys = {
    { "<leader>n", "<cmd>NvimTreeToggle<cr>", "n", desc="Nvim Tree Toggle"},
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", "n", desc="Nvim Tree Toggle"},
  },
}
