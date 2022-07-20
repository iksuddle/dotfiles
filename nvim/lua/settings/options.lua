local options = {
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

