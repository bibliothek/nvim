-- diffview registers its own user commands when required.
vim.keymap.set('n', '<leader>gv', '<cmd>DiffviewOpen<cr>',         { desc = 'Diffview Open' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', { desc = 'File History' })
