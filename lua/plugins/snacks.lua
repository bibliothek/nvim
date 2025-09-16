return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
    },
  },
  config = function(_, opts)
    require('snacks').setup(opts)

    local pick = require('snacks').picker

    vim.keymap.set('n', '<leader>,', function() pick.buffers() end, { desc = 'Switch Buffer' })
    vim.keymap.set('n', '<leader>/', function() pick.lines() end, { desc = 'Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader><space>', function() pick.files() end, { desc = 'Find Files (Root Dir)' })
    vim.keymap.set('n', '<leader>fb', function() pick.buffers() end, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fc', function() pick.files({ cwd = vim.fn.stdpath('config') }) end, { desc = 'Find Config File' })
    vim.keymap.set('n', '<leader>ff', function() pick.files() end, { desc = 'Find Files (Root Dir)' })
    vim.keymap.set('n', '<leader>fF', function() pick.files({ hidden = true, ignored = true }) end, { desc = 'Find Files (cwd)' })
    vim.keymap.set('n', '<leader>fg', function() pick.git_files() end, { desc = 'Find Files (git-files)' })
    vim.keymap.set('n', '<leader>fr', function() pick.recent() end, { desc = 'Recent' })
    vim.keymap.set('n', '<leader>fR', function() pick.recent({ cwd = true }) end, { desc = 'Recent (cwd)' })

    -- Git
    vim.keymap.set('n', '<leader>gb', function() pick.git_branches() end, { desc = 'Git Branches' })
    vim.keymap.set('n', '<leader>gc', function() pick.git_log() end, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gC', function() pick.git_log_line() end, { desc = 'Git Commits (current line)' })
    vim.keymap.set('n', '<leader>gd', function() pick.git_diff() end, { desc = 'Git Diff' })
    vim.keymap.set('n', '<leader>gf', function() pick.git_log_file() end, { desc = 'Git File History' })
    vim.keymap.set('n', '<leader>gs', function() pick.git_status() end, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gS', function() pick.git_stash() end, { desc = 'Git Stash' })

    -- Additional Git Actions
    vim.keymap.set('n', '<leader>ga', '<cmd>Git add .<cr>', { desc = 'Git Add All' })
    vim.keymap.set('n', '<leader>gA', '<cmd>Git add %<cr>', { desc = 'Git Add Current File' })
    vim.keymap.set('n', '<leader>gm', '<cmd>Git commit<cr>', { desc = 'Git Commit' })
    vim.keymap.set('n', '<leader>gM', '<cmd>Git commit --amend<cr>', { desc = 'Git Commit Amend' })
    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git Push' })
    vim.keymap.set('n', '<leader>gP', '<cmd>Git pull<cr>', { desc = 'Git Pull' })
    vim.keymap.set('n', '<leader>gL', '<cmd>Git log --oneline<cr>', { desc = 'Git Log Oneline' })
    vim.keymap.set('n', '<leader>gl', '<cmd>Git blame<cr>', { desc = 'Git Blame' })
    vim.keymap.set('n', '<leader>gr', '<cmd>Git reset<cr>', { desc = 'Git Reset' })
    vim.keymap.set('n', '<leader>gR', '<cmd>Git reset --hard<cr>', { desc = 'Git Reset Hard' })
    vim.keymap.set('n', '<leader>gw', '<cmd>Git checkout .<cr>', { desc = 'Git Restore All' })
    vim.keymap.set('n', '<leader>gW', '<cmd>Git checkout %<cr>', { desc = 'Git Restore Current' })

    -- Search
    vim.keymap.set('n', '<leader>sc', function() pick.command_history() end, { desc = 'Command History' })
    vim.keymap.set('n', '<leader>sC', function() pick.commands() end, { desc = 'Commands' })
    vim.keymap.set('n', '<leader>sd', function() pick.diagnostics() end, { desc = 'Document Diagnostics' })
    vim.keymap.set('n', '<leader>sD', function() pick.diagnostics({ workspace = true }) end, { desc = 'Workspace Diagnostics' })
    vim.keymap.set('n', '<leader>sg', function() pick.grep() end, { desc = 'Grep (Root Dir)' })
    vim.keymap.set('n', '<leader>sG', function() pick.grep({ cwd = true }) end, { desc = 'Grep (cwd)' })
    vim.keymap.set('n', '<leader>sh', function() pick.help() end, { desc = 'Help Pages' })
    vim.keymap.set('n', '<leader>sH', function() pick.highlights() end, { desc = 'Search Highlight Groups' })
    vim.keymap.set('n', '<leader>sk', function() pick.keymaps() end, { desc = 'Key Maps' })
    vim.keymap.set('n', '<leader>sl', function() pick.loclist() end, { desc = 'Location List' })
    vim.keymap.set('n', '<leader>sM', function() pick.man() end, { desc = 'Man Pages' })
    vim.keymap.set('n', '<leader>so', function() pick.options() end, { desc = 'Options' })
    vim.keymap.set('n', '<leader>sR', function() pick.resume() end, { desc = 'Resume' })
    vim.keymap.set('n', '<leader>sq', function() pick.qflist() end, { desc = 'Quickfix List' })
  end,
}
