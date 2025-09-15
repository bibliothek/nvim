return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 80,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    }
  end,
  keys = {
    {
      '<leader>e',
      function()
        require('nvim-tree.api').tree.toggle { find_file = true, open = true }
      end,
      mode = '',
      desc = 'Toggle File Tree',
    },
  },
}