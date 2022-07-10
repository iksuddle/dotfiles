local opts = { silent = true }

local set = vim.keymap.set
local g = vim.g

g.mapleader = " "

-- clear highlight
set("n", "<leader>c", ":noh<CR>", opts)

-- window navigation
set("n", "<C-h>", ":wincmd h<CR>", opts)
set("n", "<C-j>", ":wincmd j<CR>", opts)
set("n", "<C-k>", ":wincmd k<CR>", opts)
set("n", "<C-l>", ":wincmd l<CR>", opts)

-- resizing windows
set("n", "<C-Up>", ":resize -2<CR>", opts)
set("n", "<C-Down>", ":resize +2<CR>", opts)
set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- nvim tree (file explorer)
set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- telescope (fuzzy finder
local telescope = require"telescope.builtin"
set("n", "ff", telescope.find_files)
set("n", "fb", telescope.buffers)
set("n", "fh", telescope.help_tags)

-- tab bar
set("n", "<leader>.", "<Cmd>BufferNext<CR>", opts)
set("n", "<leader>,", "<Cmd>BufferPrevious<CR>", opts)

set("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)

set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
