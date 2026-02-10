local map = vim.keymap.set
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })
map('n', '<leader>x', function()
-- Get a list of all listed buffers
    local buffers = vim.fn.getbufinfo({buflisted = 1})
    if #buffers <= 1 then
        -- If it's the last buffer, just delete it (or :q if you want to quit)
        vim.cmd('bdelete')
    else
        -- If there are others, do the "switch and delete" dance
        vim.cmd('bprevious')
        vim.cmd('bdelete #')
    end
end, { silent = true, desc = 'Smart buffer delete' })
