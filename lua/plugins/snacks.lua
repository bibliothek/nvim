return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      formatters = {
        file = {
          truncate = 120,
          filename_first = true,
        }
      }
    },
    lazygit = {
      enabled = true,
    },
  },
  config = function(_, opts)
    require('snacks').setup(opts)

    local pick = require('snacks').picker
    local lazygit = require('snacks').lazygit

    vim.keymap.set('n', '<leader>,', function() pick.buffers() end, { desc = 'Switch Buffer' })
    vim.keymap.set('n', '<leader><space>', function() pick.files({ hidden = true, ignored = false }) end, { desc = 'Find Files (Root Dir)' })
    vim.keymap.set('n', '<leader>fb', function() pick.buffers() end, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fc', function() pick.files({ cwd = vim.fn.stdpath('config') }) end, { desc = 'Find Config File' })
    vim.keymap.set('n', '<leader>ff', function() pick.files({ hidden = true, ignored = false}) end, { desc = 'Find Files (Root Dir)' })
    vim.keymap.set('n', '<leader>fF', function() pick.files({ hidden = true, ignored = false }) end, { desc = 'Find Files (cwd)' })
    vim.keymap.set('n', '<leader>fg', function() pick.git_files() end, { desc = 'Find Files (git-files)' })
    vim.keymap.set('n', '<leader>fr', function() pick.recent() end, { desc = 'Recent' })

    -- Buffer management
    vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Close Current Buffer' })
    vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#<cr>', { desc = 'Close Other Buffers' })

    -- Git
    vim.keymap.set('n', '<leader>gb', function() pick.git_branches() end, { desc = 'Git Branches' })
    vim.keymap.set('n', '<leader>gc', function() pick.git_log() end, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gd', function() pick.git_diff() end, { desc = 'Git Diff' })
    vim.keymap.set('n', '<leader>gf', function() pick.git_log_file() end, { desc = 'Git File History' })
    vim.keymap.set('n', '<leader>gs', function() pick.git_status() end, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gg', function() lazygit() end, { desc = 'Lazygit' })

    -- Search
    vim.keymap.set('n', '<leader>sc', function() pick.command_history() end, { desc = 'Command History' })
    vim.keymap.set('n', '<leader>sC', function() pick.commands() end, { desc = 'Commands' })
    vim.keymap.set('n', '<leader>sd', function() pick.diagnostics() end, { desc = 'Document Diagnostics' })
    vim.keymap.set('n', '<leader>sD', function() pick.diagnostics({ workspace = true }) end, { desc = 'Workspace Diagnostics' })
    vim.keymap.set('n', '<leader>/', function() pick.grep({ hidden = true }) end, { desc = 'Grep (Root Dir)' })
    vim.keymap.set('n', '<leader>sh', function() pick.help() end, { desc = 'Help Pages' })
    vim.keymap.set('n', '<leader>sH', function() pick.highlights() end, { desc = 'Search Highlight Groups' })
    vim.keymap.set('n', '<leader>sk', function() pick.keymaps() end, { desc = 'Key Maps' })
    vim.keymap.set('n', '<leader>sM', function() pick.man() end, { desc = 'Man Pages' })
    vim.keymap.set('n', '<leader>sr', function() pick.resume() end, { desc = 'Resume' })
    vim.keymap.set('n', '<leader>sq', function() pick.qflist() end, { desc = 'Quickfix List' })
    vim.keymap.set('n', '<leader>ss', function() pick.lsp_symbols() end, { desc = 'Document Symbols' })
    vim.keymap.set('n', '<leader>sS', function() pick.lsp_symbols({workspace = true}) end, { desc = 'Workspace Symbols' })
  end,
}

