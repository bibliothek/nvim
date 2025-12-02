# AGENTS.md

This file provides guidance to coding agents when working with code in this repository.

## Overview

Personal Neovim configuration using lazy.nvim, based on Kickstart.nvim and LazyVim patterns.

## Structure

- `init.lua` - Entry point, loads modules and lazy.nvim
- `lua/globals.lua` - Leader key, global settings
- `lua/options.lua` - Vim options
- `lua/keymaps.lua` - Core keymaps
- `lua/autocmds.lua` - Autocommands (yank highlight, autosave, Helm LSP restart)
- `lua/plugins/*.lua` - Plugin specs (auto-loaded by lazy.nvim)

## LSP

Configuration in `lua/plugins/nvim-lspconfig.lua` uses Mason and direct `vim.lsp.config()` / `vim.lsp.enable()`.

## Key Bindings

Leader: `<Space>`

## Notes

- Autosave enabled on FocusLost and TextChanged
- Helm files auto-restart LSP (FileType autocmd)
- Treesitter uses Zig/gcc/clang compilers

