local codehint = require("codehint")

codehint.setup({
    api = {
        model = "gpt-3.5-turbo",
        endpoint = "https://api.openai.com/v1/chat/completions",
    },
    use_env = false,
})

vim.keymap.set("n", "<leader>h", codehint.hint)
