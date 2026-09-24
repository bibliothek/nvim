-- Buffer-local LSP maps inherit the buffer's filetype icon unless a rule matches
-- first, so give every LSP mapping the same icon based on its description.
local lsp_icons = {}
for _, pattern in ipairs {
  'code action',
  'codelens',
  'declaration',
  'definition',
  'format buffer',
  'hover',
  'implementation',
  'inlay',
  'lsp',
  'references',
  'rename',
  'symbols',
} do
  table.insert(lsp_icons, { pattern = pattern, icon = '', color = 'azure' })
end

require('which-key').setup {
  icons = { rules = lsp_icons },
}

require('which-key').add {
  -- LazyVim-style root level groups
  { '<leader>b',  group = 'buffer' },
  { '<leader>c',  group = 'code' },
  { '<leader>f',  group = 'file/find' },
  { '<leader>g',  group = 'git' },
  { '<leader>q',  group = 'quit/session' },
  { '<leader>s',  group = 'search' },
  { '<leader>x',  group = 'diagnostics/quickfix' },
  { '[',          group = 'prev' },
  { ']',          group = 'next' },
  { ']h',         desc = 'Next Git Hunk' },
  { '[h',         desc = 'Previous Git Hunk' },
  { 'g',          group = 'goto' },
  { 'gr',         group = 'lsp' },
  { 'gs',         group = 'surround' },
  { 'z',          group = 'fold' },
  -- Visual mode groups
  { '<leader>g',  group = 'git',                  mode = { 'v' } },
  { '<leader>h',  group = 'Git hunk',             mode = { 'n', 'v' } },
}
