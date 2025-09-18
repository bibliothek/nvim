return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', function()
          require('snacks').picker.lsp_definitions()
        end, '[G]oto [D]efinition')

        map('gr', function()
          require('snacks').picker.lsp_references()
        end, '[G]oto [R]eferences')

        map('gI', function()
          require('snacks').picker.lsp_implementations()
        end, '[G]oto [I]mplementation')

        map('<leader>D', function()
          require('snacks').picker.lsp_type_definitions()
        end, 'Type [D]efinition')

        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        map('H', vim.lsp.buf.hover, 'Hover Documentation')

        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>H', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, 'Toggle Inlay [H]ints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      azure_pipelines_ls = {
        root_markers = { '.git' },
        settings = {
          yaml = {
            schemas = {
              ['https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json'] = {
                '**/azure-pipelines/**/*.y*l',
                '**/azure-pipelines/*.y*l',
              },
            },
          },
        },
      },
      pyright = {},
      powershell_es = {},
      helm_ls = {},
      csharp_ls = {},
      terraformls = {},
      fsautocomplete = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    -- Set up servers directly with lspconfig
    for server_name, server_config in pairs(servers) do
      local server = vim.tbl_deep_extend('force', {}, server_config)
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      vim.lsp.config(server_name, server)
      vim.lsp.enable(server_name)
    end
  end,
}
