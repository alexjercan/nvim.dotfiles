return {
    "alexjercan/macros.nvim",
    opts = {},
    config = function (_, opts)
        require("macros").setup(opts)

        vim.keymap.set("n", "<leader>mm", "<cmd>:Macros<cr>", { noremap = true, silent = true , desc = "Macros"})
        vim.keymap.set("n", "<leader>mi", "<cmd>:MacrosInsert<cr>", { noremap = true, silent = true , desc = "MacrosInsert"})
    end
}

