return {
    dir = "alexjercan/macros.nvim",
    config = function ()
        require("macros").setup({
            file = "/home/alex/personal/the-den/scripts/data/macros.csv",
        })

        vim.keymap.set("n", "<leader>m", "<cmd>:Macros<cr>", { noremap = true, silent = true })
    end
}

