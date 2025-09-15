return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',

      build = 'make',

      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>,', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', { desc = 'Switch Buffer' })
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = 'Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader><space>', '<cmd>Telescope find_files<cr>', { desc = 'Find Files (Root Dir)' })
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fc', function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end, { desc = 'Find Config File' })
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find Files (Root Dir)' })
    vim.keymap.set('n', '<leader>fF', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>', { desc = 'Find Files (cwd)' })
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope git_files<cr>', { desc = 'Find Files (git-files)' })
    vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Recent' })
    vim.keymap.set('n', '<leader>fR', function() builtin.oldfiles({ cwd = vim.fn.getcwd() }) end, { desc = 'Recent (cwd)' })

    -- Git
    vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { desc = 'Commits' })
    vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { desc = 'Status' })

    -- Search
    vim.keymap.set('n', '<leader>sc', '<cmd>Telescope command_history<cr>', { desc = 'Command History' })
    vim.keymap.set('n', '<leader>sC', '<cmd>Telescope commands<cr>', { desc = 'Commands' })
    vim.keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', { desc = 'Document Diagnostics' })
    vim.keymap.set('n', '<leader>sD', '<cmd>Telescope diagnostics<cr>', { desc = 'Workspace Diagnostics' })
    vim.keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', { desc = 'Grep (Root Dir)' })
    vim.keymap.set('n', '<leader>sG', '<cmd>Telescope live_grep cwd=false<cr>', { desc = 'Grep (cwd)' })
    vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<cr>', { desc = 'Help Pages' })
    vim.keymap.set('n', '<leader>sH', '<cmd>Telescope highlights<cr>', { desc = 'Search Highlight Groups' })
    vim.keymap.set('n', '<leader>sk', '<cmd>Telescope keymaps<cr>', { desc = 'Key Maps' })
    vim.keymap.set('n', '<leader>sl', '<cmd>Telescope loclist<cr>', { desc = 'Location List' })
    vim.keymap.set('n', '<leader>sM', '<cmd>Telescope man_pages<cr>', { desc = 'Man Pages' })
    vim.keymap.set('n', '<leader>so', '<cmd>Telescope vim_options<cr>', { desc = 'Options' })
    vim.keymap.set('n', '<leader>sR', '<cmd>Telescope resume<cr>', { desc = 'Resume' })
    vim.keymap.set('n', '<leader>sq', '<cmd>Telescope quickfix<cr>', { desc = 'Quickfix List' })
  end,
}