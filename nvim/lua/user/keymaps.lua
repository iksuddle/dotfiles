local opts = { noremap = true, silent = true }

local set = vim.keymap.set
local g = vim.g

g.mapleader = " "

-- clear highlight
set("n", "<leader>c", ":noh<CR>", opts)

-- window navigation
set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
set("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- resizing windows
set("n", "<C-Up>", ":resize -2<CR>", opts)
set("n", "<C-Down>", ":resize +2<CR>", opts)
set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- telescope
local telescope = require"telescope.builtin"
set("n", "ff", telescope.find_files, opts)

-- nvim tree
set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

