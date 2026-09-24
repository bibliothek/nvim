-- diffview registers its own user commands when required.
vim.keymap.set('n', '<leader>gv', '<cmd>DiffviewOpen<cr>',          { desc = 'Diffview Open' })
vim.keymap.set('n', '<leader>gq', '<cmd>DiffviewClose<cr>',         { desc = 'Diffview Close' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = 'File History' })
vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory<cr>',   { desc = 'Repo History' })
