return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x", -- use 0.1.x branch for latest features/fixes
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Optional: for C implementation of fzf for speed
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim" ,
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  config=function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    -- first setup telescope
    telescope.setup({
        -- your config
    })

    -- then load the extension
    telescope.load_extension("live_grep_args")
  end

}
