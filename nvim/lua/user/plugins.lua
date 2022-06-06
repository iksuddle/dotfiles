local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print"Installing packer, restart neovim..."
    vim.cmd [[ packadd packer.nvim ]]
end

-- autocommand that reloads neovim whenever you save plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- use protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require"packer.util".float { border = "rounded" }
        end,
    },
}

-- install your plugins here
return packer.startup(function()
    use "wbthomason/packer.nvim"

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    use "nvim-lua/plenary.nvim"

    -- autocomplete
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"

    -- colorscheme
    use "navarasu/onedark.nvim"

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use { "kyazdani42/nvim-web-devicons", opt = true }
    use "nvim-lualine/lualine.nvim"
    use "nvim-telescope/telescope.nvim"
    use "kyazdani42/nvim-tree.lua"

    use "jiangmiao/auto-pairs"

    -- automatically set up config after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require"packer".sync()
    end

end)
