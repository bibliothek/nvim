# AGENTS.md

This file provides guidance to coding agents when working with code in this repository.

## Overview

Personal Neovim 0.12+ configuration using `vim.pack` for plugin management.

## Structure

- `init.lua` - Entry point, loads modules
- `lua/globals.lua` - Leader key, global settings
- `lua/options.lua` - Vim options
- `lua/keymaps.lua` - Core keymaps
- `lua/autocmds.lua` - Autocommands (yank highlight, autosave, Helm LSP restart)
- `lua/plugins/init.lua` - Plugin registration via `vim.pack.add` and ordered `require` calls for setup
- `lua/plugins/*.lua` - Each file calls `require('<plugin>').setup {}` directly (NOT lazy.nvim specs)

## Plugin Management

Uses `vim.pack.add` (Neovim 0.12+ built-in), NOT lazy.nvim. To add a plugin:
1. Add `{ src = 'https://github.com/<owner>/<repo>' }` to the `vim.pack.add` list in `lua/plugins/init.lua`
2. Create `lua/plugins/<name>.lua` with a `require('<plugin>').setup {}` call
3. Add `require 'plugins.<name>'` to the setup sequence in `lua/plugins/init.lua`
4. Update with `:lua vim.pack.update()`

## LSP

- Configuration in `lua/plugins/nvim-lspconfig.lua` uses Mason and direct `vim.lsp.config()` / `vim.lsp.enable()`
- Mason uses a custom registry (`Crashdummyy/mason-registry`) for Roslyn

## Key Bindings

Leader: `<Space>`

## Notes

- Autosave enabled on FocusLost and TextChanged

