options = {
	number = true,
	relativenumber = true,
	clipboard = "unnamedplus",
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	scrolloff = 4,
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

-- treesitter
require"nvim-treesitter.configs".setup {
    highlight = { enable = true }
}

-- colorscheme
local onedark = require"onedark"
onedark.setup {
    style = "warmer",
    ending_tildes = true
}
onedark.load()

-- status line
require"lualine".setup {
    options = {
        theme = "onedark",
        section_separators = '', 
        component_separators = '',
        globalstatus = true,
    }
}

-- file explorer
require"nvim-tree".setup {
    renderer = {
        indent_markers = { enable = true }
    },
    git = { ignore = false }
}
