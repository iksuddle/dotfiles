g = vim.g

local options = {
    number = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    scrolloff = 4,
    smarttab = true,
    smartindent = true,
    autoindent = true,
    updatetime = 500,
    splitright = true,
    splitbelow = true,
    hlsearch = true,
    showmode = false,
    ignorecase = true,
    wrap = false,
    termguicolors = true,
    undofile = true,
    cursorline = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- COLORSCHEME

local onedark = require"onedark"
onedark.setup {
    style = "warmer",
    ending_tildes = true,
}
onedark.load()

-- lualine (status line)
require"lualine".setup {
    options = { theme = "auto" }
}

-- file explorer
require"nvim-tree".setup {
    renderer = {
        indent_markers = { enable = true }
    },
    git = { ignore = false }
}

-- tree sitter
require"nvim-treesitter.configs".setup {
    ensure_installled = { "c", "python", "lua", "go" },
    highlight = { enable = true }
}

vim.cmd"set laststatus=3"              -- global status line
vim.cmd"set formatoptions-=cro"
