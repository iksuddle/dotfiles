local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require"cmp_nvim_lsp".update_capabilities(capabilities)

-- mappings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- on attach function to map keys after language server attaches on current buffer
local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

local luasnip = require"luasnip"

local cmp = require"cmp"
cmp.setup{
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-d>"] = cmp.mapping.scroll_docs(-2),
        ["<C-f>"] = cmp.mapping.scroll_docs(2),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }, {
        { name = 'buffer' }
    }
}

require"nvim-lsp-installer".setup{}
local lspconfig = require"lspconfig"

-- lua
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false
            }
        }
    }
}

-- pylsp
lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- clangd
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- gopls
lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
