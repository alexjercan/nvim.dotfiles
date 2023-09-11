local obsidian = require("obsidian")

obsidian.setup({
    dir = "~/personal/the-den/",

    notes_subdir = "Notes",

    daily_notes = {
        folder = "Daily",
        date_format = "%Y-%m-%d-%A",
        alias_format = "📝 %A, %B %d, %Y"
    },

    templates = {
        subdir = "Templates",
    },

    finder = "telescope.nvim",
    open_notes_in = "current",
})

vim.keymap.set("n", "<leader>of", function ()
    return "<cmd>ObsidianFollowLink<CR>"
end, { noremap = false, expr = true })

vim.keymap.set("n", "<leader>on", function ()
    return "<cmd>ObsidianNew<CR>"
end, { noremap = false, expr = true })

vim.keymap.set("n", "<leader>os", function ()
    return "<cmd>ObsidianSearch<CR>"
end, { noremap = false, expr = true })

vim.keymap.set("n", "<leader>ot", function()
    return "<cmd>ObsidianToday<CR>"
end, { noremap = false, expr = true })

vim.keymap.set("n", "<leader>oy", function()
    return "<cmd>ObsidianYesterday<CR>"
end, { noremap = false, expr = true })
