local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Configure Mason to install LSPs
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- List of LSPs to install
local servers = {
	'lua_ls',
	'ts_ls',
	'pyright',
}

mason_lspconfig.setup({
    ensure_installed = servers,
})

-- Setup function for each language server

local on_attach = function(client, bufnr)

    -- Enable completion for all attached LSPs
    client.server_capabilities.completionProvider = true
    
	-- Keymaps for LSP actions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })

	vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, { buffer = bufnr, desc = "Open Floating Diagnostic" })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })

    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
end

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end

--Configure nvim-cmp (autocompletion)
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
    }),
})
