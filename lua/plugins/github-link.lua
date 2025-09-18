return {
  'k2589/getgithublink.nvim',
  event = 'VeryLazy',
  config = function()
    require('getgithublink').setup()
    vim.keymap.set('n', '<leader>gP', '<cmd>GetGithubPermalink<cr>', { desc = 'Get GitHub Permalink' })
    vim.keymap.set('n', '<leader>gL', '<cmd>GetGithubUrl<cr>', { desc = 'Get GitHub Branch Link' })
  end,
}
