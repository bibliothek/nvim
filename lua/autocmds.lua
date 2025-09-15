-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autosave
vim.api.nvim_create_autocmd({ 'FocusLost', 'TextChanged', 'TextChangedI' }, {
  desc = 'Autosave on TextChanged or FocusLost',
  group = vim.api.nvim_create_augroup('Autosave', { clear = true }),
  callback = function()
    vim.cmd 'silent! wall'
  end,
})

-- helm restart lsp
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'helm',
  command = 'LspRestart',
})