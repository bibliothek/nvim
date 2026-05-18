-- Plugin management via the built-in `vim.pack` (Neovim 0.12+)
-- See `:help vim.pack`
--
-- Notes:
--  * `vim.pack.add` blocks until plugins are present on disk and added to rtp.
--    Order matters: dependencies must be listed before dependents.
--  * There is no lazy-loading: every plugin here loads at startup.
--  * Updates are manual: run `:lua vim.pack.update()` to update all plugins.
vim.pack.add({
  -- Colorschemes
  { src = 'https://github.com/catppuccin/nvim',                 name = 'catppuccin' },
  { src = 'https://github.com/rmehri01/onenord.nvim' },

  -- Common dependencies (must come before plugins that require them)
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },

  -- UI / pickers / explorer
  { src = 'https://github.com/folke/snacks.nvim' },
  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',     version = 'v3.x' },

  -- LSP / Mason
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/folke/lazydev.nvim' },

  -- Completion (cmp-nvim-lsp must be loaded before nvim-lspconfig setup runs)
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
  { src = 'https://github.com/hrsh7th/cmp-path' },
  { src = 'https://github.com/hrsh7th/nvim-cmp' },

  -- Treesitter (main branch -> new API)
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },

  -- Editing
  { src = 'https://github.com/echasnovski/mini.nvim' },

  -- Git
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/sindrets/diffview.nvim' },
  { src = 'https://github.com/bibliothek/getgithublink.nvim' },

  -- Language-specific
  { src = 'https://github.com/ionide/Ionide-vim' },
  { src = 'https://github.com/qvalentin/helm-ls.nvim' },
})

-- Now run each plugin's setup. Order matters where one setup depends on another
-- (e.g. nvim-lspconfig pulls capabilities from cmp_nvim_lsp at setup time).
require 'plugins.catppuccin'
require 'plugins.snacks'
require 'plugins.which-key'
require 'plugins.neo-tree'
require 'plugins.lazydev'
require 'plugins.nvim-cmp'
require 'plugins.nvim-lspconfig'
require 'plugins.nvim-treesitter'
require 'plugins.mini'
require 'plugins.gitsigns'
require 'plugins.diffview'
require 'plugins.github-link'
-- helm-ls, onenord, and ionide need no setup; they are simply on rtp.
