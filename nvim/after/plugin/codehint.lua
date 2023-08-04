local codehint = require("codehint")

codehint.setup({
    provider = "openai",
    args = {
        use_env = false,
        model = "gpt-3.5-turbo",
    },
})

vim.keymap.set("n", "<leader>h", codehint.hint)
