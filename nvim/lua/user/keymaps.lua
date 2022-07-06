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

