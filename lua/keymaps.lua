-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Diagnostic navigation
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Next Error" })
vim.keymap.set("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Prev Error" })
vim.keymap.set("n", "]w", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Next Warning" })
vim.keymap.set("n", "[w", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Prev Warning" })

-- Quickfix
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Split windows
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Delete window
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })