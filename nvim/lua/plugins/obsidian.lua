return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        dir = "~/personal/the-den/",

        notes_subdir = "Notes",

        daily_notes = {
            folder = "Daily",
            date_format = "%Y-%m-%d-%A",
            alias_format = "%A, %B %d, %Y",
            template = "daily.md",
        },

        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
        },

        templates = {
            subdir = "Templates",
        },

        -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
        -- URL it will be ignored but you can customize this behavior here.
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            vim.fn.jobstart({"xdg-open", url})  -- linux
        end,

        finder = "telescope.nvim",
        open_notes_in = "current",
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

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

        vim.keymap.set("n", "<leader>oo", function()
            builtin.grep_string({ cwd = "~/personal/the-den/", search = "- [ ]" })
        end)
    end,
}
