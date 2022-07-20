local set = vim.keymap.set

local opts = { silent = true }
set("n", "<leader>e", vim.diagnostic.open_float, opts)
set("n", "[d", vim.diagnostic.goto_prev, opts)
set("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
    local bufopts = { silent = true, buffer = bufnr }
    set("n", "gD", vim.lsp.buf.declaration, bufopts)
    set("n", "gd", vim.lsp.buf.definition, bufopts)
    set("n", "<leader>h", vim.lsp.buf.hover, bufopts)
    set("n", "gi", vim.lsp.buf.implementation, bufopts)
    set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    set("n", "gr", vim.lsp.buf.references, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require"cmp_nvim_lsp".update_capabilities(capabilities)

-- setup nvim lsp installer
require"nvim-lsp-installer".setup{}

local lspconfig = require"lspconfig"

-- lua
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
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

-- python
lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- luasnip setup
local luasnip = require"luasnip"

-- nvim-cmp setup
local cmp = require"cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
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
        end, { "i", "s" })
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" }
    }
}