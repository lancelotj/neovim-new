return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSP servers
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Optional: for completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- import mason-lspconfig must be done before mason.setup or mason-lspconfig.setup
    local mason_lspconfig = require("mason-lspconfig")

    -- import lspconfig
    local lspconfig = require("lspconfig")

    -- import mason and configure it
    local mason = require("mason")

    -- optional: configure mason
    mason.setup({})

    -- optional: configure mason-lspconfig
    mason_lspconfig.setup({
      -- list of servers to ensure are installed upon setup
      ensure_installed = { "pyright", "ts_ls" }, -- Example servers, add the ones you need
    })

    -- configure specific server setups with on_attach and capabilities
    -- Recommended: Use an on_attach function to set up keymaps and other functions
    local on_attach = function(client, bufnr)
      -- Enable completion capabilities
      require("cmp.config.lsp").setup_capabilities(client.capabilities)

      -- Keybindings
      local bufmap = function(mode, lhs, rhs)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Useful keymaps (examples)
      bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
      bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
      bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
      -- Add more keymaps as needed (see :help lspconfig-keybindings)
    end

  end
}
