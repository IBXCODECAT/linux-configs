vim.g.mapleader = ' ' -- Define our map leader key [Space] before any mappings are set

local map = vim.keymap.set -- shorthand

local opts = { noremap = true, silent = true }

-- Easier Window Navigation (Ctrl + H/J/K/L)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize Windows (Ctrl + Arrows) when in normal mode
map('n', '<C-Up>',		':resize +1<CR>', opts)
map('n', '<C-Down>',	':resize -3<CR>', opts)
map('n', '<C-Left>',	':vertical resize -3<CR>', opts)
map('n', '<C-Right>',	':vertical resize +1<CR>', opts)

-- Remap NetRW file explorer (pv for "Project View")
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Moving in Visual Mode [+auto indent] (Same as Alt + Arrow behavior from VSCode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Buffer to Clipboard & Clipboard to Buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

-- Replace current word (Find and replace for current word)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- LEADER MAPPINGS --
map('n', '<Leader>w', ':w<CR>', { desc = 'Write File' })
map('n', '<Leader>q', ':q<CR>', { desc = 'Quit Window/Buffer' })


