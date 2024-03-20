return {
    "alexjercan/macros.nvim",
    config = function ()
        require("macros").setup({
            file = "/home/alex/personal/the-den/scripts/data/macros.csv",
        })

        vim.keymap.set("n", "<leader>mm", "<cmd>:Macros<cr>", { noremap = true, silent = true , desc = "Macros"})
    end
}

