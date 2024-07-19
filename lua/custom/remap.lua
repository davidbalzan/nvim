vim.g.mapleader = " "
local parms = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<Leader>f', ":LspZeroFormat<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S-F>', '<Esc>:LspZeroFormat<CR>i', { noremap = true, silent = true })       

vim.api.nvim_set_keymap('n', '<C-Down>', 'yyp', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- comment line
vim.api.nvim_set_keymap('n', '<leader>/', ':CommentToggle<CR>', { noremap = true, silent = true })

-- switch buffers with ctrl+tab
vim.api.nvim_set_keymap('n', '<Leader><Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- close buffers
vim.api.nvim_set_keymap('n', '<Leader>q', ':bd<CR>', { noremap = true, silent = true })
