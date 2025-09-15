return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').add {
      -- LazyVim-style root level groups
      { '<leader>b', group = 'buffer' },
      { '<leader>c', group = 'code' },
      { '<leader>f', group = 'file/find' },
      { '<leader>g', group = 'git' },
      { '<leader>gh', group = 'hunks' },
      { '<leader>q', group = 'quit/session' },
      { '<leader>s', group = 'search' },
      { '<leader>w', group = 'windows' },
      { '<leader>x', group = 'diagnostics/quickfix' },
      { '[', group = 'prev' },
      { ']', group = 'next' },
      { 'g', group = 'goto' },
      { 'gs', group = 'surround' },
      { 'z', group = 'fold' },
      -- Visual mode groups
      { '<leader>g', group = 'git', mode = { 'v' } },
      { '<leader>h', group = 'Git hunk', mode = { 'n', 'v' } },
    }
  end,
}