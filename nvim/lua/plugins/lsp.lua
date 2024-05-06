return {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-cmdline" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")

            lsp_zero.on_attach(function(_, bufnr)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
                    { buffer = bufnr, remap = false, desc = "LSP Go to Definition" })
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
                    { buffer = bufnr, remap = false, desc = "LSP Hover" })
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
                    { buffer = bufnr, remap = false, desc = "LSP Workspace Symbol" })
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
                    { buffer = bufnr, remap = false, desc = "LSP Diagnostic" })
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
                    { buffer = bufnr, remap = false, desc = "LSP Diagnostic Next" })
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
                    { buffer = bufnr, remap = false, desc = "LSP Diagnostic Previous" })
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
                    { buffer = bufnr, remap = false, desc = "LSP Code Action" })
                vim.keymap.set("n", "<leader>vcr", function() vim.lsp.codelens.refresh() end,
                    { buffer = bufnr, remap = false, desc = "LSP Code Lens Refresh" })
                vim.keymap.set("n", "<leader>vcc", function() vim.lsp.codelens.run() end,
                    { buffer = bufnr, remap = false, desc = "LSP Code Lens Run" })
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
                    { buffer = bufnr, remap = false, desc = "LSP References" })
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
                    { buffer = bufnr, remap = false, desc = "LSP Rename" })
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                    { buffer = bufnr, remap = false, desc = "LSP Signature Help" })
                vim.keymap.set("n", "<leader>vmt", function() vim.lsp.buf.format() end,
                    { buffer = bufnr, remap = false, desc = "LSP Format" })
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                    rust_analyzer = function()
                        require('lspconfig').rust_analyzer.setup({
                            settings = {
                                ["rust-analyzer"] = {
                                    cargo = {
                                        features = "all",
                                    },
                                },
                            },
                        })
                    end,
                }
            })

            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            -- this is the function that loads the extra snippets to luasnip
            -- from rafamadriz/friendly-snippets
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                },
                formatting = lsp_zero.cmp_format({ details = false }),
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<CR>"] = nil,
                    ["<Tab>"] = nil,
                    ["<S-Tab>"] = nil,
                })
            })
        end
    },
}
