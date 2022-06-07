-- automatically install packer if not installed
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- plugins
return require("packer").startup(function()
    -- packer
    use "wbthomason/packer.nvim"
    -- lsp config and lsp installer
    use {
        "williamboman/nvim-lsp-installer",
        {
            "neovim/nvim-lspconfig",
            config = function()
                require"nvim-lsp-installer".setup{}
            end
        }
    }
    -- completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    -- snippets
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    -- lua functions used by some plugins
    use "nvim-lua/plenary.nvim"
    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    -- colorscheme
    use "navarasu/onedark.nvim"
    -- status line
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    -- file explorer
    use "kyazdani42/nvim-tree.lua"
    -- fuzzy finder
    use "nvim-telescope/telescope.nvim"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
