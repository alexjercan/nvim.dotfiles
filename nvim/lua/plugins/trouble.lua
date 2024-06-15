return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require("trouble.sources.telescope")
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = { ["<c-t>"] = trouble.open },
                    n = { ["<c-t>"] = trouble.open },
                },
            },
        })

        vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Trouble" })
        vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Trouble (Workspace Diagnostics)" })
        vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Trouble (Document Diagnostics)" })
        vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Trouble (Quickfix)" })
        vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Trouble (Location List)" })
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Trouble (LSP References)" })
    end,
}
