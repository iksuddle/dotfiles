local use = require"packer".use

return require"packer".startup(function()

    -- packer
    use "wbthomason/packer.nvim"

    -- plugins
    use "nvim-lua/plenary.nvim"     -- useful functions

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }        -- treesitter

    use "navarasu/onedark.nvim"     -- colorscheme
    use "Mofiqul/vscode.nvim"

    use "kyazdani42/nvim-tree.lua"      -- file explorer

    use "kyazdani42/nvim-web-devicons"      -- icons

    use "nvim-lualine/lualine.nvim"     -- status line

    use "nvim-telescope/telescope.nvim"     -- fuzzy finder

    use "jiangmiao/auto-pairs"      -- auto pairs

    -- lsp config
    use "williamboman/nvim-lsp-installer"       -- lsp server manager
    use "neovim/nvim-lspconfig"     -- configurations for nvim lsp

    -- completion
    use "hrsh7th/nvim-cmp"      -- nvim-cmp: autocompletion plugin
    use "hrsh7th/cmp-nvim-lsp"      -- lsp source for nvim-cmp

    -- snippets
    use "L3MON4D3/LuaSnip"      -- snippet engine
    use "saadparwaiz1/cmp_luasnip"      -- snippet source for nvim-cmp

end)
