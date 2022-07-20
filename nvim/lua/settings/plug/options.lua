-- treesitter
require"nvim-treesitter.configs".setup {
    highlight = { enable = true }
}

-- colorscheme

vim.o.background = 'dark'
require"vscode".setup {
}

-- local onedark = require"onedark"
-- onedark.setup {
--     style = "warmer",
--     ending_tildes = true
-- }
-- onedark.load()

-- nvim tree: file explorer
require"nvim-tree".setup {
    renderer = {
        indent_markers = { enable = true }
    },
    git = { ignore = false }
}

-- lualine: status line
require"lualine".setup {
    options = {
        theme = "auto",
        section_separators = '',
        component_separators = '',
        globalstatus = true
    }
}
