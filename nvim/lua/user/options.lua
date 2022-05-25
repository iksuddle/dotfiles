g = vim.g

local options = {
    number = true,
    relativenumber = true,
    clipboard = "unnamedplus",
    tabstop = 4,
    shiftwidth = 4,
    scrolloff = 4,
    smarttab = true,
    smartindent = true,
    expandtab = true,
    autoindent = true,
    updatetime = 300,
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

-- VSCODE THEME
g.vscode_style = "dark"
g.vscode_italic_comment = 1
vim.cmd [[ colorscheme vscode ]]

-- lualine (status line)
require"lualine".setup {
    options = {
        theme = "vscode"
    }
}

-- file explorer
require"nvim-tree".setup {
    renderer = {
        indent_markers = {
            enable = true
        }
    },
    git = {
        ignore = false
    }
}

vim.cmd [[ set laststatus=3 ]]      -- global status line

-- tree sitter
require"nvim-treesitter.configs".setup {
    ensure_installled = { "c", "python", "lua", "go" },
    highlight = {
        enable = true,
    }
}

