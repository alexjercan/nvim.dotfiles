return {
    "folke/which-key.nvim",
    opts = {},
    config = function(_, opts)
        require("which-key").setup(opts)

        local wk = require("which-key")
        wk.register({
            f = { name = "Find", },
            d = { name = "Debug", },
            g = { name = "Git", },
            n = { name = "Neogen", },
            t = { name = "Testing", },
            v = { name = "Lsp", },
            m = { name = "Misc", },
        }, {
            prefix = "<leader>",
        })

        vim.keymap.set("n", "<C-h>", "<cmd>:WhichKey<CR>", { silent = true, desc = "Show which-key help" })
    end,
}
