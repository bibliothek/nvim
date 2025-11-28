# Architecture

## Overview

Personal Neovim configuration based on Kickstart.nvim and LazyVim using `lazy.nvim` as the plugin manager.

## Configuration Structure

- **init.lua**: Entry point that bootstraps lazy.nvim and loads globals, options, keymaps, autocmds
- **lua/globals.lua**: Global settings (leader key, nerd font, disables netrw)
- **lua/options.lua**: Vim options including Windows PowerShell shell configuration
- **lua/keymaps.lua**: Core keymaps for navigation, diagnostics, quickfix
- **lua/autocmds.lua**: Autocommands (yank highlight, autosave, helm LSP restart)
- **lua/plugins/**: Auto-loaded plugin configurations

## Key Plugins

- **snacks.nvim**: Fuzzy finder (picker) and lazygit integration - used for all file/buffer/LSP navigation
- **nvim-lspconfig**: LSP with Mason auto-installer using Neovim 0.11+ `vim.lsp.config()` API
- **nvim-cmp**: Autocompletion with LSP, path, and snippet sources
- **neo-tree.nvim**: File explorer
- **mini.nvim**: ai, surround, statusline

## Important Details

- **Windows-specific**: PowerShell is default shell (lua/options.lua:62-69)
- **Autosave**: Enabled on TextChanged, TextChangedI, FocusLost
- **LSP servers**: azure_pipelines_ls, pyright, powershell_es (custom cmd), helm_ls, csharp_ls, terraformls, jsonls, lua_ls
- **F# support**: Ionide-vim + fsautocomplete
- **Helm support**: Autocmd restarts LSP when opening helm files

## Commands

### Formatting
```bash
stylua .  # Format Lua (2-space indent, 160 column, single quotes)
```

### Neovim Commands
- `:Lazy` / `:Lazy sync` - Plugin management
- `:Mason` - LSP/tool management
- `:LspInfo` / `:LspRestart` - LSP diagnostics

## Key Bindings

Leader: `<Space>`

**Files/Buffers**: `<leader><space>` find files | `<leader>,` buffers | `<leader>e` neo-tree
**Search**: `<leader>/` grep | `<leader>sw` grep word | `<leader>sd/sD` diagnostics | `<leader>ss/sS` symbols
**LSP**: `gd` definition | `gr` references | `gI` implementation | `<leader>ca` code action | `<leader>F` format | `H` hover
**Git**: `<leader>gg` lazygit | `<leader>gs` status | `<leader>gc` commits | `<leader>gd` diff

## Development

**Add LSP server**: Edit `lua/plugins/nvim-lspconfig.lua` servers table (line 76), Mason auto-installs
**Add plugin**: Create `lua/plugins/name.lua` returning plugin spec - lazy.nvim auto-discovers
