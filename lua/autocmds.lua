-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- LspRestart command
vim.api.nvim_create_user_command('LspRestart', function()
  for _, c in ipairs(vim.lsp.get_clients()) do
    c:stop()
  end
end, { desc = 'Restart all LSP clients' })

-- Autosave
vim.api.nvim_create_autocmd({ 'FocusLost', 'TextChanged', 'TextChangedI' }, {
  desc = 'Autosave on TextChanged or FocusLost',
  group = vim.api.nvim_create_augroup('Autosave', { clear = true }),
  callback = function()
    vim.cmd 'silent! wall'
  end,
})

