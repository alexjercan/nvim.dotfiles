local obsidian = require("obsidian")

obsidian.setup({
    dir = "~/personal/the-den/",

    daily_notes = {
        folder = "Daily",
        date_format = "%Y-%m-%d-%A"
    },

    disable_frontmatter = false,
    note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases }

        if note:has_tag("daily-notes") then
            out["tags"] = { "daily" }
        end

        if note.metadata ~= nil and obsidian.util.table_length(note.metadata) > 0 then
            for k, v in pairs(note.metadata) do
                out[k] = v
            end
        end

        return out
    end,

    templates = {
        subdir = "Templates",
    },

    finder = "telescope.nvim",
    open_notes_in = "current",
})

vim.keymap.set("n", "<leader>ot", function()
    return "<cmd>ObsidianToday<CR>"
end, { noremap = false, expr = true })

vim.keymap.set("n", "<leader>of", function ()
    return "<cmd>ObsidianFollowLink<CR>"
end, { noremap = false, expr = true })
