return {

  "folke/lazydev.nvim",
  {"folke/which-key.nvim", lazy = false},
  { "folke/neoconf.nvim", cmd = "Neoconf" },

  { "neovim/nvim-lspconfig" },             -- LSP Support (Intellisense)

  -- theme --
  {
    "rebelot/kanagawa.nvim", 
    lazy = false,
    priority = 1000,
    config = function() 
      -- Load the theme
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
